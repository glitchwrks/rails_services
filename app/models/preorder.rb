class Preorder < ApplicationRecord
  belongs_to :project

  validates :email, :presence => true
  validates :name, :presence => true

  validate :at_least_one_quantity
  validate :email_not_registered_for_project, :on => :create

  delegate :printable_name, :to => :project, :prefix => true

  private

  def at_least_one_quantity
    errors[:base] << 'You must specify at least one quantity' unless boards.present? || kits.present? || assembled.present?
  end

  def email_not_registered_for_project
    errors[:email] << 'already registered for this project' if Preorder.find_by(:email => self.email, :project => self.project)
  end
end