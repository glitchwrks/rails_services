FactoryBot.define do

  factory :valid_paste, :class => :paste do
    sequence(:name) { |n| "paste#{n}" }
    content { 'This is a test email.' }
  end

end