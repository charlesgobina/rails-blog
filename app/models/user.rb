class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.last_3_posts(id)
    Post.all.where("author_id = #{id}").order(created_at: :desc).limit(3)
  end
end
