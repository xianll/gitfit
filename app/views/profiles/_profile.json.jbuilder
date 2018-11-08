json.extract! profile, :id, :biography, :instagram_username, :age_bracket, :gender, :lifestyle, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
