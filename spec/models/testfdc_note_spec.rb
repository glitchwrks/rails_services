require 'rails_helper'

RSpec.describe TestfdcNote do

  it { is_expected.to validate_presence_of :number }
  it { is_expected.to validate_uniqueness_of :number }
  it { is_expected.to validate_presence_of :description }

end
