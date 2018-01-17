require 'rails_helper'

RSpec.describe TestfdcResult do
  describe 'validates at least one meaningful field present' do
    it { expect(FactoryGirl.build(:testfdc_result)).to be_invalid }
    it { expect(FactoryGirl.build(:testfdc_result, :manufacturer => 'Glitch Works')).to be_valid }
    it { expect(FactoryGirl.build(:testfdc_result, :model => 'GW-FDC-1')).to be_valid }
    it { expect(FactoryGirl.build(:testfdc_result, :fdc_chip => 'WAT1234')).to be_valid }

    it 'should add a meaningful error to base' do
      testfdc_result = FactoryGirl.build(:testfdc_result)
      testfdc_result.validate
      expect(testfdc_result.errors[:base]).to include('You submitted a blank report; you must fill in something!')
    end
  end
end