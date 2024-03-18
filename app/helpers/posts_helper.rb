module PostsHelper
  def user_post(post)
    post.user_id == current_user.id 
  end
end
