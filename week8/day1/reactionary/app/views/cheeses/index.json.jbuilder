json.array!(@cheeses) do |cheese|
  json.extract! cheese, :id, :name, :style
  json.url cheese_url(cheese, format: :json)
end
