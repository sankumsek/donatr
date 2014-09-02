class DonationsController < ApplicationController
  before_filter :authorize, only: [:new]

  def new
    @cause = Cause.find(params[:cause_id])
    @donation = @cause.donations.new
  end

  def create
    @cause = Cause.find(params[:cause_id])
    @donation = @cause.donations.new(donation_params)
    if @donation.save
      redirect_to cause_path(@cause), notice: 'Thanks for your donation!'
    else
      render 'new'
    end
  end

private
  def donation_params
    params.require(:donation).permit(:amount).merge(user_id: current_user.id)
  end
end
