class TestfdcResult < ApplicationRecord
  belongs_to :note, :class_name => 'TestfdcNote'

  def approve!
  	self.update_attributes!(:approved => true)
  end
end