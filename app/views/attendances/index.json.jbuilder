json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :guest_id, :attendance_rate_id, :event_id
  json.url attendance_url(attendance, format: :json)
end
