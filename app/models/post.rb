class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comment, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy
  has_many :like, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def self.last_5_comments(id)
    Comment.all.where("post_id = #{id}").order(created_at: :desc).limit(5)
  end
end
