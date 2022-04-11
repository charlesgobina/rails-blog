module PostsHelper
  def no_comment
    content_tag(:p, 'No comments yet.') if @comments.empty?
  end

  # def nopost_comment
  #   if @comments.empty?
  #     "No comments yet."
  #   end
  # end
end
