class User < ApplicationRecord

  has_secure_password

  validates :login, :presence => true, :uniqueness => { :case_sensitive => true }

end
