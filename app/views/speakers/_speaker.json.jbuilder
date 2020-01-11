json.extract! speaker, :id, :name, :role, :linkedin_handle, :twitter_handle, :github_handle, :company, :company_logo, :profile_pic,:created_at, :updated_at
json.url speaker_url(speaker, format: :json)
