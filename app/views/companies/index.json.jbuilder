json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :email, :phone, :website, :logo
  json.url company_url(company, format: :json)
end
