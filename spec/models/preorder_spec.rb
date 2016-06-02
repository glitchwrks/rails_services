require 'rails_helper'

RSpec.describe Preorder do

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to delegate_method(:printable_name).to(:project).with_prefix }

  describe 'validates at least one quantity present' do
    it { expect(FactoryGirl.build(:preorder)).to be_invalid }
    it { expect(FactoryGirl.build(:preorder, :boards => 1)).to be_valid }
    it { expect(FactoryGirl.build(:preorder, :kits => 1)).to be_valid }
    it { expect(FactoryGirl.build(:preorder, :assembled => 1)).to be_valid }

    it 'should add a meaningful error to base' do
      preorder = FactoryGirl.build(:preorder)
      preorder.validate
      expect(preorder.errors[:base]).to include('You must specify at least one quantity')
    end
  end

  describe 'validates only one preorder per project per email' do
    let!(:first_preorder) { FactoryGirl.create(:preorder, :email => 'dupe@glitchwrks.com', :boards => 1) }
    let!(:second_preorder) { FactoryGirl.build(:preorder, :email => 'dupe@glitchwrks.com', :boards => 1) }

    it { expect(first_preorder).to be_valid }
    it { expect(second_preorder).to be_invalid }

    it 'should add a meaningful error to email' do
      second_preorder.validate
      expect(second_preorder.errors[:email]).to include('already registered for this project')
    end
  end
end