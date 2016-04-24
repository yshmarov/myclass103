json.array!(@payments) do |payment|
  json.extract! payment, :id, :client_id, :enrollment_id, :amount, :office_id
  json.url payment_url(payment, format: :json)
end
