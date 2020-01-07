json.extract! event, :id, :name, :description, :location, :pic, :created_at, :updated_at
json.url event_url(event, format: :json)
