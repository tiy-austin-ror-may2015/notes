json.array!(@screencasts) do |screencast|
  json.extract! screencast, :id, :title, :url, :price
  json.url screencast_url(screencast, format: :json)
end
