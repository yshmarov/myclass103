json.array!(@service_names) do |service_name|
  json.extract! service_name, :id, :name
  json.url service_name_url(service_name, format: :json)
end
