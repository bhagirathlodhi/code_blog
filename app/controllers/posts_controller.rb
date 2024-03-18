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


# <div>
#   <p><%= comment.body %></p>
#   <%= link_to "Reply", new_post_comment_path(@post, parent_comment_id: comment.id) %>
#   <% comment.replies.each do |reply| %>
#     <%= render partial: 'comment', locals: { comment: reply } %>
#   <% end %>
# </div>


# def new
#   @post = Post.find(params[:post_id])
#   @parent_comment = Comment.find(params[:parent_comment_id])
#   @comment = @parent_comment.replies.build
# end


# class CommentsController < ApplicationController
#   def create
#     @post = Post.find(params[:post_id])
#     @comment = @post.comments.build(comment_params)
#     if @comment.save
#       redirect_to @post, notice: 'Comment was successfully created.'
#     else
#       render 'posts/show'
#     end
#   end

#   private

#   def comment_params
#     params.require(:comment).permit(:body, :parent_comment_id)
#   end
# end

# <%= render partial: 'comments/reply', locals: { replies: comment.replies, comment: comment } %>
#     <%= render partial: 'comments/comment', locals: { comments: comment.replies, post: post } if comment.replies.any? %>
