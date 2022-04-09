require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Post Modes" do
    user = User.create name: 'Charles', photo: 'some_pic', bio: 'Full-Stack Dev'
    post = Post.new author: user, title: 'samsung', text: 'samsung post'


    it 'title should be present' do
      post.title = nil
      expect(post).to_not be_valid
      post.title = 'samsung'
    end

    it 'title should be less than 250 characters' do
      post.title = 'samsung' * 250
      expect(post).to_not be_valid
      post.title = 'samsung' * 50
    end

    it 'comments_counter should be integer' do
      post.comments_counter = 'string'
      expect(post).to_not be_valid
      post.comments_counter = 0
    end

    it 'like_counter should be integer' do
      post.like_counter = 'string'
      expect(post).to_not be_valid
      post.like_counter = 0
    end
  
  end
  
end
