class Paste < ApplicationRecord

  validates :name, :presence => true, :uniqueness => { :case_sensitive => true }
  validates :content, :presence => true

end