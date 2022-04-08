class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment, class_name: 'Comment', dependent: :destroy
  has_many :like, class_name: 'Like', dependent: :destroy

  def last_5_comment
    comment.limit(5).order(created_at: :desc)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
