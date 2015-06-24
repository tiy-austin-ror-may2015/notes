json.array!(@users) do |user|
  json.extract! user, :id, :name, :preference
  json.url user_url(user, format: :json)
end
