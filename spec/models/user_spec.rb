require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = create(:user)
    @user2 = create(:random_user)
    @user3 = create(:random_user)
  end

  describe 'validates' do
    it 'name must not be blank' do
      expect(@user1.name).to eq 'John'
    end

    it 'Number of users must be an integer it to be 1.' do
      expect(User.all.count).to eq 3
    end
  end
end
