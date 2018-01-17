class TestfdcResult < ApplicationRecord
  belongs_to :note, :class_name => 'TestfdcNote'

  RESULT_OPTIONS = [['Pass', 1], ['Fail', 0], ['Not Tested', '']]
  NOT_TESTED = ''

  def approve!
  	self.update_attributes!(:approved => true)
  end
end