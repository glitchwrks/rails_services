require 'rails_helper'

feature 'Confirm a preorder' do
  let!(:preorder) { FactoryGirl.create(:confirmable_preorder) }
  let(:project) { preorder.project }

  scenario 'User confirms a valid preorder' do
  	visit "/preorders/confirm/#{preorder.confirmation_token}"
  	expect(page).to have_text("You have successfully confirmed your #{project.printable_name} preorder!")
  	expect(Preorder.find(preorder.id)).to be_a ConfirmedPreorder
  end

  scenario 'User attempts to confirm an invalid preorder' do
  	visit '/preorders/confirm/123invalid'
  	expect(page).to have_text('Invalid Confirmation Token')
  end
end
