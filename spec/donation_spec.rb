require 'rails_helper'

describe Donation do
  it {should validate_presence_of :amount}
  it {should validate_numericality_of :amount}
  it {should belong_to :cause}
  it {should belong_to :user}

  it "should total all donations for the specified cause" do
    me = User.create(name: "me", password: "me", password_confirmation: "me")
    new_bike = Cause.create(name: "New Bike", description: "I need a new bike")
    donation = Donation.create(amount: 100, cause_id: new_bike.id, user_id: me.id)
    expect(Donation.total(new_bike)).to eq 100
  end
end
