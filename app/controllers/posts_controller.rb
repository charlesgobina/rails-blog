class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = User.last_3_posts(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      redirect_to user_posts_path(post.author)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
