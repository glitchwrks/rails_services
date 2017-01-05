class ApplicationRecord < ActiveRecord::Base
  before_create :assign_uuid

  self.abstract_class = true
  self.primary_key = :id

  private
  
  def assign_uuid
    self.id = UUIDTools::UUID.timestamp_create().to_s.upcase if id.blank?
  end
end