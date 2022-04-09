require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    first_user = User.create(name: 'Zane', photo: 'some_photo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hola', text: 'This is my first post')
    comment = Comment.new(post: first_post, author: first_user, text: 'This is my first comment')

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
