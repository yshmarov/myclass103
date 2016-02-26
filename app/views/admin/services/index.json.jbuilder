json.array!(@services) do |service|
  json.extract! service, :id, :service_name_id, :event_quantity, :event_length, :uprice, :gprice, :gtype, :ctype, :is_active
  json.url service_url(service, format: :json)
end
