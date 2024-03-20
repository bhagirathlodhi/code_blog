class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create 
    @user = User.find_by(id: current_user.id)
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'post has been created successfully'
    else
      render :new, notice: 'Somthing went wrong'
    end
  end

  def show
    # respond_to do |format|
    #   format.turbo_stream { render turbo_stream: turbo_stream.append(:comments, partial: "comments/comment", locals: { comment: @comment }) }
    #   format.html { redirect_to @post }
    # end
  end

  def show_user_posts
    @posts = current_user.posts
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'post has been updated successfully'
    else
      render :root_path, notice: "something went wrong"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted"
  end

  
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :des, :pimg)
  end
end


