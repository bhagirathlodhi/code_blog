class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    redirect_to @post, notice: 'you commented'
  end

  def edit 
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: "comment updated"
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to @post, notice: "comment deleted"
  end

  
  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :parent_comment_id)
    end
end
  # def new
  #   @post = Post.find(params[:post_id])
  #   @parent_comment = Comment.find(params[:parent_comment_id])
  #   @comment = @parent_comment.replies.build
  # end