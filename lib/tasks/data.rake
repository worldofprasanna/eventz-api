require 'csv'

namespace :data do
  desc "Populate the initial data from the CSV file"
  task populate_all: :environment do
    import_conf_and_speaker
    import_csv('talks', Talk)
    import_csv('promo_codes', PromoCode)
    import_csv('ticket_prices', TicketPrice)
    update_conference_for_talks()
    update_speaker_for_talks()
  end

  def file_name_for_type(type)
    case type
    when 'PromoCode'
      'promo_codes'
    when 'Speaker'
      'speakers'
    when 'Conference'
      'conferences'
    when 'Talk'
      'talks'
    end
  end

  task populate: :environment do
    type = ENV['type']
    file_name = file_name_for_type(type)
    puts "Importing the type #{type} using the file #{file_name}"
    import_csv(file_name, type.constantize)
  end

  def csv_data(file_name)
    data = []
    CSV.foreach("#{Rails.root}/data/#{file_name}.csv",
      :headers => true,
      header_converters: lambda { |f| f.strip },
      converters: lambda { |f| f&.strip }
    ) do |row|
      data << row.to_h
    end
    data
  end

  def import_csv(file_name, klass)
    puts "Import started for #{klass}"
    current_time = Time.now
    data = csv_data(file_name)
    result = klass.import(data, validate: false)
    puts "Imported #{result.num_inserts} records for #{klass} in #{Time.now - current_time} seconds"
  end

  def import_conf_and_speaker
    conferences = csv_data('conferences')
    speakers = csv_data('speakers')
    current_time = Time.now

    conferences.each_with_index do |c, i|
      conf = Conference.create(c)
      conf.speakers << Speaker.create(speakers[i])
    end
    Conference.create_slugs
    puts "Imported #{conferences.count} records for Conference and Speakers in #{Time.now - current_time} seconds"
  end

  def update_conference_for_talks()
    result = ExecuteSql.new('update talks set conference_id = conf.id from conferences conf where talks.conference_name = conf.title').run
  end

  def update_speaker_for_talks()
    result = ExecuteSql.new('update talks set speaker_id = speaker.id from speakers speaker where talks.speaker_name = speaker.name').run
  end
end
