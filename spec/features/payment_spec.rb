require 'rails_helper'

RSpec.describe 'PaymentPage', type: :feature do
  before :all do
    @user = create(:random_user)
    @utility = @user.utilities.create(name: 'Utility')
    @payment = @user.payments.create(name: 'Electricity', amount: 10)

    @utility_payment = UtilityPayment.create(utility_id: @utility.id, payment_id: @payment.id)
  end

  context 'testing' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
      page.find("##{@utility.id}").click
    end

    it 'should redirect us payments path' do
      expect(page).to have_current_path(user_utility_path(user_id: @user.id, id: @utility.id))
    end

    it 'should have page title Utility' do
      expect(page).to have_content 'Utility'
    end

    it 'when New Transactions clicked should open new transaction page' do
      click_link 'New Transactions'
      expect(page).to have_current_path(new_user_payment_path(user_id: @user.id))
    end

    it 'should have page title NEW TRANSACTION' do
      click_link 'New Transactions'
      expect(page).to have_content 'NEW TRANSACTION'
    end

    it 'should navigate back to categories page' do
      click_link 'New Transactions'
      page.find('.back-link').click
      expect(page).to have_current_path(user_utilities_path(user_id: @user.id))
    end
  end

  context 'testing' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      all('input[name="commit"]').first.click
      page.find("##{@utility.id}").click
      click_link 'New Transactions'
      fill_in 'Name', with: 'Water'
      fill_in 'Amount', with: 10
      find('#payment_utility_id').find(:xpath, 'option[1]').select_option
    end

    it 'should take us back to category page' do
      all('input[name="commit"]').first.click
      expect(page).to have_current_path(user_utility_path(user_id: @user.id, id: @utility.id))
    end

    it 'should successfuly create new category and count should be 1' do
      all('input[name="commit"]').first.click
      expect(@user.utilities.count).to eq 1
    end

    it 'the category name should be Water' do
      all('input[name="commit"]').first.click
      expect(@user.utilities.first.name).to eq 'Utility'
    end

    it 'the utility payment payment_id should be 1' do
      expect(@utility_payment.payment_id).to eq @payment.id
    end

    it 'the utility payment utility_id should be 1' do
      expect(@utility_payment.utility_id).to eq @utility.id
    end
  end
end
