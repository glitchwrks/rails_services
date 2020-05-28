class Project < ApplicationRecord
  has_many :preorders

  validates :name, :presence => true, :uniqueness => { :case_sensitive => true }
  validates :printable_name, :presence => true

  def confirmed_preorders
  	preorders.confirmed
  end
end