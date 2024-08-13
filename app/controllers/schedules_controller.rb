class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html
      format.json { render json: @schedules }
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :description, :start_date, :end_date, :user_id)
  end
end
