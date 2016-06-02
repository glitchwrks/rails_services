FactoryGirl.define do

  factory :project do
    sequence(:name) { |n| "project#{n}"} 
    sequence(:printable_name) { |n| "Test Project #{n}" }
  end

  factory :enabled_project, :parent => :project do
    enabled true
  end

  factory :disabled_project, :parent => :project do
    enabled false
  end
end