json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :service_id, :event_group_id, :user_id, :coupon_id, :opp_status_id
  json.url enrollment_url(enrollment, format: :json)
end
