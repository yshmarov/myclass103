json.array!(@attr2s) do |attr2|
  json.extract! attr2, :id, :name
  json.url attr2_url(attr2, format: :json)
end
