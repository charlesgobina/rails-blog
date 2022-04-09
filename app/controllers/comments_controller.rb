class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}/", notice: 'Comment was successfully created.'
    else
      render :new, alert: 'Comment was not created.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
