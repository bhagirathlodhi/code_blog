module CommentsHelper
  def user_comment(comment)
    comment.user_id == current_user.id
  end
end
