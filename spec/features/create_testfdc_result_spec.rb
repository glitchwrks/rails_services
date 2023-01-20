require 'rails_helper'

feature 'Submit a TestFDC result report' do

  before(:each) do
    visit new_testfdc_result_path
  end

  scenario 'User submits a blank form' do
    click_button 'Submit Your TestFDC Results'
    expect(page).to have_text 'You submitted a blank report; you must fill in something!'
  end

  describe 'when the user fills in something' do
    before(:each) do 
      fill_in :manufacturer, :with => 'ACME Corp'
      click_button 'Submit Your TestFDC Results'
    end

    it { expect(page).to have_text 'TestFDC Result Submitted' }
    it { expect(page).to have_text 'Thanks for your TestFDC results submission! It will be reviewed shortly.' }

    it 'should not display the unapproved result in the main registry page' do
      visit testfdc_results_path
      expect(page).not_to have_text 'ACME Corp'
    end
  end

end
