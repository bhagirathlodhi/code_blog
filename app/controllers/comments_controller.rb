class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update destroy]
  before_action :find_post, only: %i[create destroy]
  def create
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append(:comments, partial: "comments/comment", locals: { comment: @comment }) }
      format.html { redirect_to @post }
    end
  end

  def edit 
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: "comment updated"
    end

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      format.html { redirect_to @post }
    end
  end

  
  private

    def find_comment
      @comment = Comment.find(params[:id])
    end
    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :parent_comment_id)
    end
end
