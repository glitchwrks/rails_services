require 'rails_helper'

RSpec.describe Project do

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_presence_of :printable_name }
end