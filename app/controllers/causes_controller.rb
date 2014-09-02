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

private
  def cause_params
    params.require(:cause).permit(:name, :description)
  end
end
