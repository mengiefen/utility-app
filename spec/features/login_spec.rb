require 'rails_helper'

RSpec.describe 'LoginPage', type: :feature do
  before :all do
    @user = create(:random_user)
  end

  context 'testing' do
    before :each do
      visit new_user_session_path
    end

    it 'should open sign in page' do
      expect(page).to have_current_path('/users/sign_in')
    end

    it 'username should render correctly' do
      expect(page).to have_content 'Forgot your password?'
    end

    it 'Redirects me to the root page' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
      expect(page).to have_current_path('/')
    end

    it 'should have content of the page' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
      expect(page).to have_content 'Categories'
    end
  end
end
