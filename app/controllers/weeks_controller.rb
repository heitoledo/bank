class WeeksController < ApplicationController
  before_action :set_week, only: [:show, :edit, :update, :destroy]

  def index
    @weeks = Week.all
  end

  def show
  end

  def new
    @week = Week.new
  end

  def edit
  end

  def create
    @week = Week.new(week_params)
    @week.save

    respond_with @week
  end

  def update
    @week.update(week_params)
    respond_with @week
  end

  def destroy
    @week.destroy
    respond_with @week
  end

  private
    def set_week
      @week = Week.find(params[:id])
    end

    def week_params
      params.require(:week).permit(:start_date, :end_date)
    end
end
