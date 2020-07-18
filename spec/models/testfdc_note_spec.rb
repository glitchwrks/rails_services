require 'rails_helper'

RSpec.describe TestfdcNote do

  it { is_expected.to validate_presence_of :number }
  it { is_expected.to validate_uniqueness_of :number }
  it { is_expected.to validate_presence_of :description }

  describe '#to_report_s' do
    let(:new_note) { TestfdcNote.new(:number => '1', :description => 'Test Note') }

    it { expect(new_note.to_report_s).to eq '1. Test Note' }
  end

end
