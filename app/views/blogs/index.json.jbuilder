json.array!(@blogs) do |blog|
  json.extract! blog, :username, :blog, :comments, :usertype
  json.url blog_url(blog, format: :json)
end
