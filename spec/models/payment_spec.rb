require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = create(:payment)
  end

  describe 'validates' do
    it 'payment name to be Electricity' do
      expect(@payment.name).to eq 'Electricity'
    end

    it 'Number of paymentsmust be an integer it to be 1.' do
      expect(Payment.all.count).to eq 1
    end

    it 'paymen user name should be John.' do
      expect(@payment.user.name).to eq 'John'
    end
  end
end
