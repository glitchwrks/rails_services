class TestfdcResult < ApplicationRecord
  belongs_to :note, :class_name => 'TestfdcNote'

  validate :at_least_one_field_populated

  RESULT_OPTIONS = [['Pass', 1], ['Fail', 0], ['Not Tested', '']]
  NOT_TESTED = ''

  def approve!
    self.update_attributes!(:approved => true)
  end

  private

  def at_least_one_field_populated
    errors[:base] << 'You submitted a blank report; you must fill in something!' unless manufacturer.present? || model.present? || fdc_chip.present?
  end
end