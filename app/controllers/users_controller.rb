class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = User.last_3_posts(params[:id])
  end
end
