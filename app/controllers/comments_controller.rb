class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        # @user = current_user
        @comment = @post.comments.create(comment_params.merge(user: current_user))
        redirect_to root_path
      end
    
      private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
