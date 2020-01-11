json.extract! conference, :id, :title, :location, :description, :image_url, :start_date, :created_at, :updated_at, :duration, :price, :total_talks
json.url conference_url(conference, format: :json)
