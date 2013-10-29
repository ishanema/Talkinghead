json.array!(@comments) do |comment|
  json.extract! comment, :name, :postid, :userid
  json.url comment_url(comment, format: :json)
end
