FactoryBot.define do
  factory :user do
    name { 'John' }
    email { 'john.doe@example.com' }
    password { '123456' }
  end

  factory :random_user, class: User do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password { '123456' }
  end
end
