json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :service_id, :event_group_id, :user_id, :coupon_id, :opp_status_id
  json.url opportunity_url(opportunity, format: :json)
end
