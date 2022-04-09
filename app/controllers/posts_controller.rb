class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = User.last_3_posts(params[:user_id])
    @posts = @user.posts.include(:comments, :likes)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      redirect_to user_posts_path(post.author), notice: 'Post was successfully created.'
    else
      render :new, alert: 'Post was not created.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
