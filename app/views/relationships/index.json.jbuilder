json.set! :relationships do
  json.array! @relationships do |relationship|
    json.id relationship.id
    json.user_id relationship.user_id
    json.follow_id relationship.follow_id
    json.user relationship.user
    json.follow relationship.follow
    json.posts relationship.follow.posts do |post|
      json.id post.id
      json.title post.title
      json.image rails_blob_url(post.post_image) if post.post_image.attached?
      json.user_id post.user_id
      json.post_likes post.likes
      json.created_at post.created_at
    end
    json.created_at relationship.created_at
  end
end