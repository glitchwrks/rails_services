require 'rails_helper'

RSpec.describe Project do

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_presence_of :printable_name }

  describe '#confirmed_preorders' do
  	let!(:project) { FactoryBot.create(:enabled_project) }
  	let!(:confirmed_preorder) { FactoryBot.create(:confirmable_preorder, :project => project, :confirmed => true) }
  	let!(:unconfirmed_preorder) { FactoryBot.create(:confirmable_preorder, :project => project) }

  	it { expect(project.confirmed_preorders).to be_present }
  	it { expect(project.confirmed_preorders).to include(confirmed_preorder) }
  	it { expect(project.confirmed_preorders).not_to include(unconfirmed_preorder) }
  end
end