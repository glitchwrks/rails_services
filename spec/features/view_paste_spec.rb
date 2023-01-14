require 'rails_helper'

feature 'View a Paste' do
  let!(:paste) { FactoryBot.create(:valid_paste) }

  describe 'User views approved results' do
  	before(:each) do
    	visit paste_path(paste.name)
		end

    it { expect(page).to have_text(paste.content) }
  end

end
