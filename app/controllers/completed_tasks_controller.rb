class CompletedTasksController < ApplicationController
  before_action :set_completed_task, only: [:show, :edit, :update, :destroy]

  # GET /completed_tasks
  # GET /completed_tasks.json
  def index
    @completed_tasks = CompletedTask.all
  end

  # GET /completed_tasks/1
  # GET /completed_tasks/1.json
  def show
  end

  # GET /completed_tasks/new
  def new
    @completed_task = CompletedTask.new
  end

  # GET /completed_tasks/1/edit
  def edit
  end

  # POST /completed_tasks
  # POST /completed_tasks.json
  def create
    @completed_task = CompletedTask.new(completed_task_params)

    respond_to do |format|
      if @completed_task.save
        format.html { redirect_to current_user, notice: 'Your Task Has Been Marked As Completed' }
        format.json { render action: 'show', status: :created, location: @completed_task }
      else
        format.html { render action: 'new' }
        format.json { render json: @completed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /completed_tasks/1
  # PATCH/PUT /completed_tasks/1.json
  def update
    respond_to do |format|
      if @completed_task.update(completed_task_params)
        format.html { redirect_to @completed_task, notice: 'Completed task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @completed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_tasks/1
  # DELETE /completed_tasks/1.json
  def destroy
    @completed_task.destroy
    respond_to do |format|
      format.html { redirect_to completed_tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_task
      @completed_task = CompletedTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def completed_task_params
      params.require(:completed_task).permit(:user_id, :group_id, :task_id)
    end
end
