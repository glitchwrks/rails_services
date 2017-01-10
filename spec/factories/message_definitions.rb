FactoryGirl.define do

  factory :valid_message, :class => :message do
    sequence(:email) { |n| "test#{n}@somehost.com"} 
    name 'Test User'
    subject 'Test Email'
    content 'This is a test email.'
    check 'human'
    address '1.2.3.4'
  end

  factory :suspicious_message, :parent => :valid_message do
    subject 'Test <b>Email</b>'
    content 'This <i>is</i> a test email.'
  end

  factory :spammy_message, :parent => :valid_message do
    check 'robot'
  end
end