json.array!(@expences) do |expence|
  json.extract! expence, :id, :amount, :description, :user_id
  json.url expence_url(expence, format: :json)
end
