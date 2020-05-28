class TestfdcResult < ApplicationRecord
  belongs_to :note, :class_name => 'TestfdcNote'

  validate :at_least_one_field_populated

  RESULT_OPTIONS = [['Pass', 1], ['Fail', 0], ['Not Tested', '']]
  NOT_TESTED = ''

  def approve!
    self.update!(:approved => true)
  end

  def result_string=(results)
    self.fm_250 = process_result_string_character(results[0])
    self.mfm_250 = process_result_string_character(results[1])
    self.mfm_250_128 = process_result_string_character(results[2])

    self.fm_300 = process_result_string_character(results[4])
    self.mfm_300 = process_result_string_character(results[5])
    self.mfm_300_128 = process_result_string_character(results[6])

    self.fm_500 = process_result_string_character(results[8])
    self.mfm_500 = process_result_string_character(results[9])
    self.mfm_500_128 = process_result_string_character(results[10])
  end

  private

  def process_result_string_character(result_char)
    return true if result_char == 'P'
    return false if result_char == 'F'
    nil
  end

  def at_least_one_field_populated
    errors[:base] << 'You submitted a blank report; you must fill in something!' unless manufacturer.present? || model.present? || fdc_chip.present?
  end
end