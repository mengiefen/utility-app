require 'rails_helper'

RSpec.describe UtilityPayment, type: :model do
  before do
    @utility_payment = FactoryBot.create(:utility_payment)
  end

  describe 'validates' do
    it 'utitlity payment name to be Electricity' do
      expect(@utility_payment.payment.name).to eq 'Random Payment'
    end

    it 'Number of utility payments must be an integer it to be 1.' do
      expect(UtilityPayment.all.count).to eq 1
    end

    it 'utility payments category name should be "Utility".' do
      expect(@utility_payment.utility.name).to eq 'Random Utility'
    end
  end
end
