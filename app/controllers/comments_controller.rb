class CommentsController < ApplicationController

  def create
    # debugger
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    redirect_to root_path #, notice: 'you commented'
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body, :parent_comment_id)
    end
end
  # def new
  #   @post = Post.find(params[:post_id])
  #   @parent_comment = Comment.find(params[:parent_comment_id])
  #   @comment = @parent_comment.replies.build
  # end