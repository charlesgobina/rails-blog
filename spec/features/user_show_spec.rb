require 'rails_helper'

describe 'user index page', type: :feature do
  context 'accessing user index page' do
    before :each do
      visit new_user_session_path
      @subject_user = User.create!(name: 'Juan', photo: 'img', bio: 'Dev', posts_counter: 0,
                                   email: 'abcd@gmail.com', password: '123456', password_confirmation: '123456')
      within 'form' do
        fill_in 'Email', with: 'abcd@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      click_link 'Juan'
    end

    it 'shows the user index page' do
      expect(page).to have_current_path(user_path(@subject_user.id))
    end

    it 'shows the user name' do
      expect(page).to have_content('Juan')
    end

    it 'shows image of the user' do
      all('img').each do |i|
        expect(i[:src]).to eq('img')
      end
    end

    it 'shows user biography' do
      expect(page).to have_content('Biography')
    end

    it 'should show number of posts' do
      expect(page).to have_content(@subject_user.posts_counter)
    end
  end

  context 'accessing user index page' do
    before :each do
      visit new_user_session_path
      @subject_user = User.create!(name: 'Juan', photo: 'img', bio: 'Dev', posts_counter: 0,
                                   email: 'abcd@gmail.com', password: '123456', password_confirmation: '123456')
      @first_post = Post.create!(author: @subject_user, title: 'samsung', text: 'samsung post')
      @second_post = Post.create!(author: @subject_user, title: 'google', text: 'google post')
      @third_post = Post.create!(author: @subject_user, title: 'apple', text: 'apple post')
      within 'form' do
        fill_in 'Email', with: 'abcd@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      click_link 'Juan'
    end

    it 'should show last three posts' do
      expect(page).to have_content(@first_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end

    it 'should have button to see all posts' do
      expect(page).to have_button('See all posts')
    end

    it 'should redirect to show post page after clicking post' do
      click_link @first_post.title
      expect(page).to have_current_path(user_post_path(@subject_user.id, @first_post.id))
    end

    it 'should redirect to user post index page after clicking see all posts' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@subject_user))
    end
  end
end
