json.array!(@sales) do |sale|
  json.extract! sale, :id, :service_id, :event_group_id, :user_id, :coupon_id, :opp_status_id
  json.url sale_url(sale, format: :json)
end
