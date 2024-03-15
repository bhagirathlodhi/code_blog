class RepliesController < ApplicationController
  def create
    
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params.merge(user: current_user))
    redirect_to root_path
  end

  private
    def reply_params
      params.require(:reply).permit(:body)
    end
end
