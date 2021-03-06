require 'rails_helper'

RSpec.describe TestfdcResult do
  let(:empty_testfdc_result) { FactoryBot.build(:empty_testfdc_result) }

  describe 'validates at least one meaningful field present' do
    it { expect(FactoryBot.build(:empty_testfdc_result)).to be_invalid }
    it { expect(FactoryBot.build(:empty_testfdc_result, :manufacturer => 'Glitch Works')).to be_valid }
    it { expect(FactoryBot.build(:empty_testfdc_result, :model => 'GW-FDC-1')).to be_valid }
    it { expect(FactoryBot.build(:empty_testfdc_result, :fdc_chip => 'WAT1234')).to be_valid }

    it 'should add a meaningful error to base' do
      empty_testfdc_result.validate
      expect(empty_testfdc_result.errors[:base]).to include('You submitted a blank report; you must fill in something!')
    end

    describe '#result_string=' do
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').fm_250).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_250).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_250_128).to be_truthy }

      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').fm_300).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_300).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_300_128).to be_truthy }

      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').fm_500).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_500).to be_truthy }
      it { expect(TestfdcResult.new(:result_string => 'PPP PPP PPP').mfm_500_128).to be_truthy }

      it { expect(TestfdcResult.new(:result_string => 'FFF FFF FFF').fm_250).to be_falsey }
      it { expect(TestfdcResult.new(:result_string => 'FFF FFF FFF').mfm_250).to be_falsey }
      it { expect(TestfdcResult.new(:result_string => 'FFF FFF FFF').mfm_250_128).to be_falsey }

      it { expect(TestfdcResult.new(:result_string => 'FFF NNN FFF').fm_300).to be_nil }
      it { expect(TestfdcResult.new(:result_string => 'FFF NNN FFF').mfm_300).to be_nil }
      it { expect(TestfdcResult.new(:result_string => 'FFF NNN FFF').mfm_300_128).to be_nil }

      it { expect(TestfdcResult.new(:result_string => 'FFF FFF NNN').fm_500).to be_nil }
      it { expect(TestfdcResult.new(:result_string => 'FFF FFF NNN').mfm_500).to be_nil }
      it { expect(TestfdcResult.new(:result_string => 'FFF FFF NNN').mfm_500_128).to be_nil }
    end
  end

  describe 'string generation methods' do
    let(:testfdc_note) { TestfdcNote.new(:number => '1', :description => 'Test Note') }
    let(:valid_testfdc_result) { FactoryBot.build(:testfdc_result, :model => 'GW-FDC-1', :note => testfdc_note) }

    it { expect(valid_testfdc_result.to_report_s).to eq 'Glitch Works    GW-FDC-1                Foochip 6000    ISA     PFN PFN PFN 1' }
    it { expect(empty_testfdc_result.to_report_s).to eq '                                                                NNN NNN NNN ' }
    it { expect(valid_testfdc_result.result_string).to eq 'PFN PFN PFN' }
  end
end