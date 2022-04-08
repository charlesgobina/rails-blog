class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = User.last_3_posts(params[:user_id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comment
    @user = @post.author
  end
end
