require 'rails_helper'

RSpec.describe ApplicationSetting do

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :value }
  
  it 'should require #sti_type and give a meaningful error' do
    setting = ApplicationSetting.new
    expect(setting).to be_invalid
    expect(setting.errors[:sti_type]).to include('ApplicationSetting is an abstract parent class and cannot be persisted.')
  end

  describe 'Boolean settings' do
    it { expect(FactoryGirl.build(:boolean_setting, :value => 'true').typecast_value).to be_truthy }
    it { expect(FactoryGirl.build(:boolean_setting, :value => 'false').typecast_value).to be_falsey }

    it 'should not allow values other than true and false' do
      boolean_setting = FactoryGirl.build(:boolean_setting, :value => 'untrue')
      expect(boolean_setting).to be_invalid
      expect(boolean_setting.errors[:value]).to include('Value must be true or false')
    end
  end

  describe 'String settings' do
    it { expect(FactoryGirl.build(:string_setting, :value => 'a string').typecast_value).to eq 'a string'}
  end

  describe '#find_by_name' do
    let!(:boolean_setting) { FactoryGirl.create(:boolean_setting, :value => 'true') }
    let!(:string_setting) { FactoryGirl.create(:string_setting, :value => 'the string setting') }

    it { expect(ApplicationSetting.find_by_name(boolean_setting.name)).to be_truthy }
    it { expect(ApplicationSetting.find_by_name(string_setting.name)).to eq 'the string setting' }
    it { expect { ApplicationSetting.find_by_name('nonexistent') }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
