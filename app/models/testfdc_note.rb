class TestfdcNote < ApplicationRecord
  has_many :testfdc_results

  validates :number, :presence => true, :uniqueness => true
  validates :description, :presence => true
end