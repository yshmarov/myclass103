json.array!(@offices) do |office|
  json.extract! office, :id, :name, :address, :email, :phone, :company_id
  json.url office_url(office, format: :json)
end
