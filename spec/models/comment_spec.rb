require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    before(:each) do
      subject_user = User.new(name: 'Charles', photo: 'img', bio: 'Dev', posts_counter: 0,
                              email: 'abc@gmail.com', password: '123456', password_confirmation: '123456')

      visit new_user_session_path
      login_as(subject_user, scope: :user)
      first_post = Post.new(author: subject_user, title: 'Hola', text: 'This is my first post')
      comment = Comment.new(post: first_post, author: subject_user, text: 'This is my first comment')

      before { comment.save }

      it 'comment should be present' do
        expect(first_post.comments.length).to eq 1
      end

      it 'comment should be correct' do
        expect(comment.text).to eq 'This is my first comment'
      end

      it 'first post comment should be correct' do
        expect(first_post.comments.first.text).to eq 'This is my first comment'
      end
    end
  end
end
