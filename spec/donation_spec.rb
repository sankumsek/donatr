require 'rails_helper'

describe Donation do
  it {should validate_presence_of :amount}
  it {should validate_numericality_of :amount}
  it {should belong_to :cause}
  it {should belong_to :user}
end
