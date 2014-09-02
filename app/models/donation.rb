class Donation < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount

  belongs_to :cause
  belongs_to :user
end
