json.array!(@event_groups) do |event_group|
  json.extract! event_group, :id, :name, :status, :service_id, :attr1_id, :attr2_id, :attr3_id
  json.url event_group_url(event_group, format: :json)
end
