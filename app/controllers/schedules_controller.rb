class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: %i[show edit update destroy]
  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html
      format.json { render json: @schedules }
    end
  end

  def show
    @tasks = @schedule&.tasks
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id

    if @schedule.save
      redirect_to schedules_path, notice: 'Cronograma criado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :description, :start_date, :end_date, :user_id)
  end
end
