class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment, class_name: 'Comment', dependent: :destroy
  has_many :like, class_name: 'Like', dependent: :destroy

  def last_5_comment
    comment.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
