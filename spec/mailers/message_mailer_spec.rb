require 'rails_helper'

RSpec.describe MessageMailer do
  before(:each) do
    BooleanSetting.find_or_create_by(:name => 'save_failed_messages').update(:value => 'true', :description => 'Save failed messages')
    BooleanSetting.find_or_create_by(:name => 'save_suspicious_messages').update(:value => 'true', :description => 'Save suspicious messages')
    StringSetting.find_or_create_by(:name => 'contact_email').update(:value => 'test@test.com', :description => 'Email to send contact messages to')
  end

  describe '#contact' do
    let(:email) { MessageMailer.contact(message).deliver_now }

    describe 'with a valid message' do
      let!(:message) { FactoryBot.build(:valid_message) }

      it { expect(email.subject).to eq "#{message.subject} (from contact form)" }
      it {expect(email.to).to include(ApplicationSetting.find_by_name('contact_email')) }
      it {expect(email.from).to include(message.email) }
      it {expect(email.reply_to).to include(message.email) }

      it {expect(email.body).to include(message.content) }
    end

    describe 'with a message containing HTML' do
      let!(:message) { FactoryBot.build(:suspicious_message) }

      it {expect(email.body).to include('*** WARNING: Original subject contained HTML, which was stripped! ***') }
      it {expect(email.body).to include('*** WARNING: Original message contained HTML, which was stripped! ***') }
    end
  end
end