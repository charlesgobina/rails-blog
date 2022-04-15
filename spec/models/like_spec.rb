require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    before(:each) do
      subject_user = User.new(name: 'Charles', photo: 'img', bio: 'Dev', posts_counter: 0,
                              email: 'abc@gmail.com', password: '123456', password_confirmation: '123456')

      visit new_user_session_path
      login_as(subject_user, scope: :user)
      first_post = Post.new(author: subject_user, title: 'Hola', text: 'This is my first post')
      like = Like.new(post: first_post, author: subject_user)

      before { like.save }

      it 'like should be present' do
        expect(first_post.likes.length).to eq 1
      end
    end
  end
end
