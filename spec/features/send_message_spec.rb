require 'rails_helper'

feature 'Send a message' do
  before(:each) do
    BooleanSetting.find_or_create_by(:name => 'save_failed_messages').update_attributes(:value => 'true', :description => 'Save failed messages')
    BooleanSetting.find_or_create_by(:name => 'save_suspicious_messages').update_attributes(:value => 'true', :description => 'Save suspicious messages')
    StringSetting.find_or_create_by(:name => 'contact_email').update_attributes(:value => 'test@test.com', :description => 'Email to send contact messages to')
    visit new_message_path
  end

  scenario 'User submits a blank form' do
    click_button 'Send Message'
    expect(page).to have_text("can't be blank")
  end

  scenario 'User submits a properly filled out message' do
    fill_in :message_name, :with => 'Test User'
    fill_in :message_email, :with => 'testuser@test.com'
    fill_in :message_subject, :with => 'A Test Message'
    fill_in :message_content, :with => 'This is a test message.'
    choose 'human'
    click_button 'Send Message'
    expect(page).to have_text('Success! You should be hearing back from us shortly!')
    expect(Message.where(:name => 'Test User', :failed => true)).to be_empty
    expect(Message.where(:name => 'Test User', :suspicious => true)).to be_empty
  end

  scenario 'User fills out a message with HTML' do
    fill_in :message_name, :with => 'Test User'
    fill_in :message_email, :with => 'testuser@test.com'
    fill_in :message_subject, :with => 'A Test Message'
    fill_in :message_content, :with => 'This is a test message.<b>TEST</b>'
    choose 'human'
    click_button 'Send Message'
    expect(page).to have_text('Success! You should be hearing back from us shortly!')
    expect(Message.where(:name => 'Test User', :suspicious => true)).not_to be_empty
  end

  scenario 'User fills out a message and fails the CAPTCHA' do
    fill_in :message_name, :with => 'Test User'
    fill_in :message_email, :with => 'testuser@test.com'
    fill_in :message_subject, :with => 'A Test Message'
    fill_in :message_content, :with => 'This is a test message.'
    click_button 'Send Message'
    expect(page).to have_text('Success! You should be hearing back from us shortly!')
    expect(Message.where(:name => 'Test User', :failed => true)).not_to be_empty
  end
end