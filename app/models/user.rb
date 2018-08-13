class User < ApplicationRecord
  has_secure_password
  # attr_accessor :password

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :uniqueness => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
end
