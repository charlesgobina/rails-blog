class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      flash.notice = 'You liked this post!'
    else
      flash.alert = 'Error liking post!'
    end
    redirect_to user_post_path(user_id: current_user.id, id: @post.id)
  end
end
