class TestfdcNote < ApplicationRecord
  has_many :testfdc_results

  validates :number, :presence => true, :uniqueness => { :case_sensitive => true }
  validates :description, :presence => true

  def to_report_s
    "#{number}. #{description}"
  end
end