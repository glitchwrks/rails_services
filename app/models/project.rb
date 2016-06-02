class Project < ActiveRecord::Base
  has_many :preorders

  validates :name, :presence => true, :uniqueness => true
  validates :printable_name, :presence => true
end