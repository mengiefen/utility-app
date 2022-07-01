require 'rails_helper'

RSpec.describe 'CategoryPage', type: :feature do
  before :all do
    @user = create(:random_user)
  end

  context 'testing' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
    end

    it 'should redirect us to category path' do
      expect(page).to have_current_path('/')
    end

    it 'should have page title Categories' do
      expect(page).to have_content 'Categories'
    end

    it 'when New Utility clicked should open new category page' do
      click_link 'New Utility'
      expect(page).to have_current_path(new_user_utility_path(user_id: @user.id))
    end

    it 'should have page title NEW CATEGORY' do
      click_link 'New Utility'
      expect(page).to have_content 'NEW CATEGORY'
    end

    it 'should navigate back to categories page' do
      click_link 'New Utility'
      find('.back-link').click
      expect(page).to have_current_path(user_utilities_path(user_id: @user.id))
    end
  end

  context 'testing' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
      click_link 'New Utility'
      fill_in 'Name', with: 'Water'
    end

    it 'should take us back to category page' do
      all('input[name="commit"]').first.click
      expect(page).to have_current_path(user_utilities_path(user_id: @user.id))
    end

    it 'should successfuly create new category and count should be 1' do
      all('input[name="commit"]').first.click
      expect(@user.utilities.count).to eq 1
    end

    it 'the category name should be Water' do
      all('input[name="commit"]').first.click
      expect(@user.utilities.first.name).to eq 'Water'
    end
  end
end
