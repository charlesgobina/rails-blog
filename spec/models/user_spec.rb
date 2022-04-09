require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User model" do
    subject_user = User.new(name: 'Charles', photo: 'https://bit.ly/3LSqRtb', bio: 'Full-Stack Dev')

    before { subject_user.save }

    it 'name should be present' do
      subject_user.name = nil
      expect(subject).to_not be_valid
      subject_user.name = 'Charles'
    end
  
    it 'post_counter should be integer' do
      subject_user.posts_counter = 'string'
      expect(subject).to_not be_valid
      subject_user.posts_counter = 0
    end
  end
end
