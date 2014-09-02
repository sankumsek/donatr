class CausesController < ApplicationController
  before_filter :authorize, only: [:new, :edit, :update]

  def index
    @causes = Cause.all
  end

  def new
    @cause = Cause.new
  end

  def create
    @cause = Cause.new(cause_params)
    if @cause.save
      redirect_to cause_path(@cause), notice: 'Cause added!'
    else
      render 'new'
    end
  end

  def show
    @cause = Cause.find(params[:id])
    @total = Donation.total(@cause)
  end

  def edit
    @cause = Cause.find(params[:id])
  end

  def update
    @cause = Cause.find(params[:id])
    if @cause.update_attributes(cause_params)
      redirect_to @cause, notice: "Cause updated"
    else
      render "edit"
    end
  end

  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy
    redirect_to root_url, notice: "Cause deleted"
  end

private
  def cause_params
    params.require(:cause).permit(:name, :description)
  end
end
