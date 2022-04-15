require 'rails_helper'

describe 'user index page', type: :feature do
  context 'accessing user index page' do
    before :each do
      visit new_user_session_path
      User.create(name: 'Charles', photo: 'https://bit.ly/3LSqRtb', bio: 'Full-Stack Dev',
                  posts_counter: 0, email: 'abc@gmail.com', password: '123456', password_confirmation: '123456')
      within 'form' do
        fill_in 'Email', with: 'abc@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'shows the user index page' do
      expect(page).to have_current_path(root_path)
    end

    it 'shows image of the user' do
      all('img').each do |i|
        expect(i[:src]).to eq('https://bit.ly/3LSqRtb')
      end
    end

    it 'should have 0 posts' do
      expect(page).to have_content('0 Posts')
    end

    it 'should redirect to user show page' do
      click_link 'Charles'
      expect(page).to have_content('Biography')
    end
  end
end
