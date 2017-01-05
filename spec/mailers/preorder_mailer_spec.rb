require 'rails_helper'

RSpec.describe PreorderMailer do
  describe '#confirmation' do
    let!(:preorder) { FactoryGirl.build(:confirmable_preorder) }
    let(:project) { preorder.project }
    let(:email) { PreorderMailer.confirmation(preorder).deliver_now }

    it { expect(email.subject).to eq "#{project.printable_name} Preorder Confirmation" }
    it {expect(email.to).to include(preorder.email) }
    it {expect(email.from).to include('noreply@glitchwrks.com') }
    it {expect(email.reply_to).to include('noreply@glitchwrks.com') }

    it {expect(email.body).to include("https://services.theglitchworks.net/preorders/confirm?token=#{preorder.confirmation_token}") }
  end
end