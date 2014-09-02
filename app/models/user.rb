class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :donations
  has_many :causes, through: :donations
end
