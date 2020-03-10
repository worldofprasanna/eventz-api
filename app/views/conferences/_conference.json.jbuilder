json.extract! conference, :id, :title, :location, :description, :image_url, :start_date, :created_at, :updated_at, :duration, :total_talks, :prices, :slug
json.url conference_url(conference, format: :json)
