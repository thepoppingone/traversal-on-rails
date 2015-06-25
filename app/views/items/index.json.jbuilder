json.array!(@items) do |item|
  json.extract! item, :id, :name, :type, :minTemperature, :maxTemperature, :season
  json.url item_url(item, format: :json)
end
