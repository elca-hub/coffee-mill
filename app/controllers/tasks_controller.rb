class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new(user: current_user)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    # バリデーションに引っかかった場合
    if @task.save
      redirect_to user_task_path(@task), notice: "Task was successfully created."
    else
      flash.now[:alert] = @task.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to user_task_path(@task), notice: "Task was successfully updated."
    else
      flash.now[:alert] = @task.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    redirect_to user_tasks_path, notice: "Task was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(
        :title,
        :hour,
        :reason,
        :before_situation,
        :after_situation,
        :after_action,
        :other
      )
    end
end
