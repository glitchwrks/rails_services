FactoryGirl.define do

  factory :application_setting do
    sequence(:name) { |n| "test_setting_#{n}"} 
    description 'A Test Setting'
  end

  factory :boolean_setting, :parent => :application_setting, :class => :boolean_setting
  factory :string_setting, :parent => :application_setting, :class => :string_setting
end