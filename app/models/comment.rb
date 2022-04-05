class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_posts_comments_counter

  def update_posts_comments_counter
    post.increment!(:comments_counter)
  end
end
