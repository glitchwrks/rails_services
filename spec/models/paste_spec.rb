require 'rails_helper'

RSpec.describe Paste do

  describe 'validations' do
    subject { FactoryBot.create(:valid_paste) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :content }
  end

end