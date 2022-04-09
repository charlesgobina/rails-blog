require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    first_user = User.create(name: 'Zane', photo: 'some_photo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hola', text: 'This is my first post')
    like = Like.new(post: first_post, author: first_user)

    before { like.save }

    it 'like should be present' do
      expect(first_post.likes.length).to eq 1
    end
  end
end
