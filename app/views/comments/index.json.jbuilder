json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :guest_id
  json.url comment_url(comment, format: :json)
end
