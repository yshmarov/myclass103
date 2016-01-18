json.array!(@cash_collections) do |cash_collection|
  json.extract! cash_collection, :id, :amount, :office_id, :admin_id
  json.url cash_collection_url(cash_collection, format: :json)
end
