require 'rails_helper'

feature 'View approved TestFDC results' do
  let!(:approved_result) { FactoryBot.create(:testfdc_result, :approved) }
  let!(:unapproved_result) { FactoryBot.create(:testfdc_result) }

  before(:each) do
    visit testfdc_results_path
  end

  describe 'User views approved results' do
    it { expect(page).to have_text(approved_result.model) }
    it { expect(page).not_to have_text(unapproved_result.model) }
  end

end
