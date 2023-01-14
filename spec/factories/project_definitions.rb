FactoryBot.define do

  factory :project do
    sequence(:name) { |n| "project#{n}"} 
    sequence(:printable_name) { |n| "Test Project #{n}" }

    trait :enabled do
      enabled { true }
    end

    trait :disabled do
      enabled { false }
    end
  end

end