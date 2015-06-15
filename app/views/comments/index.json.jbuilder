json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :user, :belongs_to
  json.url comment_url(comment, format: :json)
end
