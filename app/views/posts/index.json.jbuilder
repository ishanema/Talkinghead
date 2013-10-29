json.array!(@posts) do |post|
  json.extract! post, :postid, :name, :blog, :discforum
  json.url post_url(post, format: :json)
end
