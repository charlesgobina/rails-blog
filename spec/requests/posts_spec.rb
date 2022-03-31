require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET posts" do
    before(:each) { get '/users/:user_id/posts' }
    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe "GET single post" do
    before(:each) { get '/users/:user_id/posts/:id' }
    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:show)
    end
  end
end
