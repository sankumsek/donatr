class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :donations
  has_many :causes, through: :donations
end
