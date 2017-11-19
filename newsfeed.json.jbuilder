json.array! @posts do |post|
  json.type post.class.name
  json.content post.content
  json.user do
    json.type post.user.class.name
    json.name post.user.name
  end
  json.comments post.comments do |comment|
    json.type comment.class.name
    json.user do
      json.type comment.user.class.name
      json.name comment.user.name
    end
    json.content comment.content
  end
end
