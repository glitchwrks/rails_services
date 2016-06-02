require 'rails_helper'

RSpec.describe RecaptchaVerificationService do
  let(:service) { RecaptchaVerificationService.new('preorder', '', '127.0.0.1') }
  let(:mock_response) { double('http_response') }

  describe 'when the HTTP response returns a status of false' do
    before(:each) do
      allow(mock_response).to receive(:body).and_return('{ "success": false, "challenge_ts": "2016-05-24 12:34:56", "hostname": "host.test.com", "error-codes": ["some codes"] }')
      allow(Net::HTTP).to receive(:post_form).and_return(mock_response)
      service.execute
    end

    it { expect(service.execute).to be_falsey }
    it { expect(RecaptchaFailure.count).to eq 1 }
    it { expect(RecaptchaFailure.first.challenge_timestamp).to eq '2016-05-24 12:34:56' }
    it { expect(RecaptchaFailure.first.hostname).to eq 'host.test.com' }
    it { expect(RecaptchaFailure.first.address).to eq '127.0.0.1' }
    it { expect(RecaptchaFailure.first.error_codes).to eq 'some codes' }
  end

  describe 'when the HTTP response returns a status of true' do
    before(:each) do
      allow(mock_response).to receive(:body).and_return('{ "success": true }')
      allow(Net::HTTP).to receive(:post_form).and_return(mock_response)
    end

    it { expect(service.execute).to be_truthy }
    it { expect(RecaptchaFailure.count).to eq 0 }
  end
end