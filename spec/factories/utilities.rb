FactoryBot.define do
  factory :utility do
    name { 'Utility' }
    user { create(:user) }
  end

  factory :random_utility, class: Utility do
    name { 'Random Utility' }
    user { create(:random_user) }
  end
end
