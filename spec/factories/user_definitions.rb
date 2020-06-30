FactoryBot.define do

  factory :user do
    sequence(:login) { |n| "test_user_#{n}"} 
    password { 'testing' }
    password_confirmation { 'testing' }
    api_access { false }
  end

  factory :api_user, :parent => :user do
  	api_access { true }
  end
end