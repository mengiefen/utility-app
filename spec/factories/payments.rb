FactoryBot.define do
  factory :payment do
    name { 'Electricity' }
    amount { 40 }
    user { create(:user) }
  end

  factory :random_payment, class: Payment do
    name { 'Random Payment' }
    user { create(:random_user) }
  end
end
