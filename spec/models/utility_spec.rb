require 'rails_helper'

RSpec.describe Utility, type: :model do
  before do
    @utility = create(:utility)
  end

  describe 'validates' do
    it 'utility name to be Utility' do
      expect(@utility.name).to eq 'Utility'
    end

    it 'Number of utilities must be an integer it to be 1.' do
      expect(Utility.all.count).to eq 1
    end

    it 'utility user name should be John.' do
      expect(@utility.user.name).to eq 'John'
    end
  end
end
