require 'rails_helper'

RSpec.describe Message do

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :subject }
  it { is_expected.to validate_presence_of :content }

  describe 'content sanitization' do
    let!(:message_with_html) { Message.new(:content => 'Test <b>Content</b>', :subject => 'Test <i>Subject</i>') }
    let!(:message_without_html) { Message.new(:content => 'Plain Content', :subject => 'Plain Subject') }

    describe 'sanitizing content and subject' do
      describe 'with a provided sanitizer class' do
        let!(:mock_sanitizer) { double('MockSanitizer') }

        before(:each) do
          message_with_html.sanitizer = mock_sanitizer
        end

        it '#sanitized_content should call the provided sanitizer class with the message contents' do
          expect(mock_sanitizer).to receive(:clean).with(message_with_html.content)
          message_with_html.sanitized_content
        end

        it '#sanitized_subject should call the provided sanitizer class with the message subject' do
          expect(mock_sanitizer).to receive(:clean).with(message_with_html.subject)
          message_with_html.sanitized_subject
        end
      end

      describe 'when using the default sanitizer' do
        it { expect(message_with_html.sanitized_content).to eq 'Test Content' }
        it { expect(message_with_html.sanitized_subject).to eq 'Test Subject' }
      end
    end

    describe 'HTML checker methods' do
      it { expect(message_with_html.subject_contains_html?).to be_truthy }
      it { expect(message_with_html.content_contains_html?).to be_truthy }
      it { expect(message_with_html.contains_html?).to be_truthy }
      it { expect(message_without_html.subject_contains_html?).to be_falsey }
      it { expect(message_without_html.content_contains_html?).to be_falsey }
      it { expect(message_without_html.contains_html?).to be_falsey }
    end
  end
end