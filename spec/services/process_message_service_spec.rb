require 'rails_helper'

RSpec.describe ProcessMessageService do
  let(:service) { ProcessMessageService.new(message) }
  let(:processed_message) { service.execute }

  before(:each) do
    BooleanSetting.find_or_create_by(:name => 'save_failed_messages').update_attributes(:value => 'true', :description => 'Save failed messages')
    BooleanSetting.find_or_create_by(:name => 'save_suspicious_messages').update_attributes(:value => 'true', :description => 'Save suspicious messages')
    StringSetting.find_or_create_by(:name => 'contact_email').update_attributes(:value => 'test@test.com', :description => 'Email to send contact messages to')
  end

  describe 'with a valid message' do
    let!(:message) { FactoryBot.build(:valid_message) }

    it { expect(processed_message).not_to be_suspicious }
    it { expect(processed_message).not_to be_persisted }

    it 'should send the message' do
      expect_any_instance_of(MessageMailer).to receive(:contact).with(processed_message)
      service.execute
    end
  end

  describe 'with a suspicious message' do
    let!(:message) { FactoryBot.build(:suspicious_message) }

    it { expect(processed_message).to be_suspicious }
    it { expect(processed_message).to be_persisted }

    it 'should still send the message' do
      expect_any_instance_of(MessageMailer).to receive(:contact).with(processed_message)
      service.execute
    end

    it 'should not persist the message if configured not to save_suspicious_messages' do
      BooleanSetting.find_by(:name => 'save_suspicious_messages').update_attributes(:value => 'false')
      expect(processed_message).not_to be_persisted
    end
  end
end