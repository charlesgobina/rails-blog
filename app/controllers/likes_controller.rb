class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id), notice: 'You liked this post!'
    else
      redirect_to user_post_path(user_id: current_user.id, id: @post.id), alert: 'Error liking post!'
    end
  end
end
