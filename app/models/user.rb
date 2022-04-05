class User < ApplicationRecord
  has_many :post, class_name: 'Post', foreign_key: 'post_id'
  has_many :comment, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy
  has_many :like, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  def self.last_3_posts(id)
    Post.all.where("author_id = #{id}").order(created_at: :desc).limit(3)
  end
end
