class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = User.last_3_posts(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = @post.author
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @user.posts_counter -= 1
    @post.destroy!
    @user.save
    redirect_to user_post_path(@user.id)
    flash[:notice] = 'Post was successfully deleted.'
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      flash.notice = 'Post was successfully created.'
      redirect_to user_posts_path(post.author)
    else
      flash.alert = 'Post was not created.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
