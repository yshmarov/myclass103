json.array!(@events) do |event|
  json.extract! event, :id, :starts_at, :duration, :room_id, :user_id, :event_group_id
  json.url event_url(event, format: :json)
end
