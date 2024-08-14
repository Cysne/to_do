# frozen_string_literal: true

# controller de tarefas
class TasksController < ApplicationController
  before_action :set_schedule
  before_action :set_task, only: %i[edit update destroy]

  def new
    @task = @schedule.tasks.build
  end

  def create
    @task = @schedule.tasks.build(task_params)
    if @task.save
      redirect_to schedule_path(@schedule), notice: 'Tarefa criada com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to schedule_path(@schedule), notice: 'Tarefa atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to schedule_path(@schedule), notice: 'Tarefa excluída com sucesso.'
  end

  def reorder
    @task.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def set_task
    @task = @schedule.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :schedule_id)
  end
end
