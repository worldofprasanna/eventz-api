require 'csv'

namespace :data do
  desc "Populate the initial data from the CSV file"
  task populate: :environment do
    import_csv('speakers', Speaker)
    import_csv('conferences', Conference)
    import_csv('talks', Talk)
    import_csv('promo_codes', PromoCode)
    update_conference_for_talks()
    update_speaker_for_talks()
  end

  def import_csv(file_name, klass)
    puts "Import started for #{klass}"
    current_time = Time.now
    data = []
    CSV.foreach("#{Rails.root}/data/#{file_name}.csv",
      :headers => true,
      header_converters: lambda { |f| f.strip },
      converters: lambda { |f| f&.strip }
    ) do |row|
      data << row.to_h
    end
    result = klass.import(data, validate: false)
    puts "Imported #{result.num_inserts} records for #{klass} in #{Time.now - current_time} seconds"
  end

  def update_conference_for_talks()
    result = ExecuteSql.new('update talks set conference_id = conf.id from conferences conf where talks.conference_name = conf.title').run
  end

  def update_speaker_for_talks()
    result = ExecuteSql.new('update talks set speaker_id = speaker.id from speakers speaker where talks.speaker_name = speaker.name').run
  end
end
