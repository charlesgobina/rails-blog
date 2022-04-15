require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts' do
    before(:each) do
      it 'has a 200 success status code' do
        expect(response).to have_http_status(200)
      end
      it 'If a correct template was rendered' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET single post' do
    before(:each) do
      it 'has a 200 success status code' do
        expect(response).to have_http_status(200)
      end
      it 'If a correct template was rendered' do
        expect(response).to render_template(:show)
      end
    end
  end
end
