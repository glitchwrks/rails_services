class TestfdcResult < ApplicationRecord
  belongs_to :note, :class_name => 'TestfdcNote'

  validate :at_least_one_field_populated

  RESULT_OPTIONS = [['Pass', 1], ['Fail', 0], ['Not Tested', '']]
  NOT_TESTED = ''

  delegate :test_result, :to => :class

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

  def result_string
    return_string = "#{test_result(fm_250)}#{test_result(mfm_250)}#{test_result(mfm_250_128)} "
    return_string += "#{test_result(fm_300)}#{test_result(mfm_300)}#{test_result(mfm_300_128)} "
    return_string += "#{test_result(fm_500)}#{test_result(mfm_500)}#{test_result(mfm_500_128)}"
    return_string
  end

  def to_report_s
    "#{padded_manufacturer} #{padded_model} #{padded_fdc_chip} #{padded_class} #{result_string} #{note_number_or_blank}"
  end

  # BEGIN Class Methods

  def self.test_result(input)
    return 'N' if input.nil?
    input ? 'P' : 'F'
  end

  # END Class Methods

  private

  def at_least_one_field_populated
    errors[:base] << 'You submitted a blank report; you must fill in something!' unless manufacturer.present? || model.present? || fdc_chip.present?
  end

  def fixed_length(input, length)
    (input || '').slice(0..length).ljust(length)
  end

  def note_number_or_blank
    note.number if note.present?
  end

  def padded_manufacturer
    fixed_length(manufacturer, 15)
  end

  def padded_model
    fixed_length(model, 23)
  end

  def padded_fdc_chip
    fixed_length(fdc_chip, 15)
  end

  def padded_class
    fixed_length(hardware_class, 7)
  end

  def process_result_string_character(result_char)
    return true if result_char == 'P'
    return false if result_char == 'F'
    nil
  end
end