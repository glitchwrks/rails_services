class ApplicationSetting < ApplicationRecord
  self.inheritance_column = :sti_type

  validates :name, :presence => true, :uniqueness => { :case_sensitive => true }
  validates :description, :presence => true
  validates :value, :presence => true
  validates :sti_type, :presence => { :message => 'ApplicationSetting is an abstract parent class and cannot be persisted.' }

  # BEGIN Class Methods

  def self.find_by_name(setting_name)
    ApplicationSetting.find_by!(:name => setting_name).typecast_value
  end

  # END Class Methods
end