class Donation < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount

  belongs_to :cause
  belongs_to :user

  def self.total(cause)
    total = Donation.where("cause_id = ?", cause.id).sum("amount")
  end
end
