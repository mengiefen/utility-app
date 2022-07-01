FactoryBot.define do
  factory :utility_payment do
    utility { create(:random_utility) }
    payment { create(:random_payment) }
  end
end
