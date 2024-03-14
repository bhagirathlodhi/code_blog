class PostsController < ApplicationController
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

  def show_user_posts
    @posts = current_user.posts
  end
  private

  # def set_post
  #   @post = Post.find(params[:id])
  # end

  def post_params
    params.require(:post).permit(:title, :des, :pimg)
  end
end
