require 'rails_helper'
RSpec.describe 'post_show_route', type: :feature do
  describe 'Post' do
    before(:each) do
      User.create(name: 'Affaxed', photo: 'link', bio: 'Dukes Child from Whistledown', posts_counter: 0,
                  email: 'blanac@gmail.com', password: '123456', password_confirmation: '123456')
      User.create(name: 'Jik', photo: 'link', bio: 'Best cleaner', posts_counter: 0,
                  email: 'blancaa@gmail.com', password: '123456', password_confirmation: '123456')
      User.create(name: 'Downey', photo: 'link', bio: 'downey is not junior', posts_counter: 0,
                  email: 'downeyy@gmail.com', password: '123456', password_confirmation: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'blanac@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      Post.create(title: 'First Post', text: 'first post', author: User.first)
      Post.create(title: 'Second Post', text: 'second post', author: User.first)
      Post.create(title: 'Third Post', text: 'third post', author: User.first)
      Comment.create(text: 'Thy shall not find', author: User.first, post: Post.first)
      Comment.create(text: 'Her majesty Lady Whistledown', author: User.first, post: Post.first)
      Comment.create(text: 'It was astounding', author: User.first, post: Post.first)
      visit user_post_path(User.first.id, Post.first.id)
    end
    it 'Display post title' do
      expect(page).to have_content(Post.first.title)
    end
    it 'displays author name of posts' do
      expect(page).to have_content(Post.first.author.name)
    end
    it 'displays number of comments for post' do
      post = Post.first
      expect(post.comments_counter).to eq(post.comments.size)
    end
    it 'displays number of likes for post' do
      post = Post.first
      expect(post.like_counter).to eq(post.likes.size)
    end
    it 'displays username of commentor' do
      comments = Comment.first
      expect(page).to have_content(comments.author.name)
    end
    it 'displays content of comment' do
      comments = Comment.first
      expect(page).to have_content(comments.text)
    end
  end
end
