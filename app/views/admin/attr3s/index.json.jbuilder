json.array!(@attr3s) do |attr3|
  json.extract! attr3, :id, :name
  json.url attr3_url(attr3, format: :json)
end
