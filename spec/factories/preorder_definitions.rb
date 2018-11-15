require 'securerandom'

FactoryBot.define do

  factory :preorder do
    sequence(:email) { |n| "test#{n}@glitchwrks.com"} 
    name { 'Test User' }
  end

  factory :populated_preorder, :parent => :preorder do
    boards { 1 }
    kits { 2 }
    assembled { 3 }
  end

  factory :preorder_with_enabled_project, :parent => :populated_preorder do
    association :project
  end

  factory :confirmable_preorder, :parent => :preorder_with_enabled_project do
    confirmation_token { SecureRandom.urlsafe_base64 }
  end
end