class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin, except: [:show]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @tasks_1 = Task.where("level = ?", 1)
    @tasks_2 = Task.where("level = ?", 2)
    @tasks_3 = Task.where("level = ?", 3)
    @tasks_4 = Task.where("level = ?", 4)
    @tasks_5 = Task.where("level = ?", 5)
    @tasks_6 = Task.where("level = ?", 6)
    @tasks_grid = initialize_grid(@tasks)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @completed_task = CompletedTask.new
    @group_task = GroupTask.new
    @group_task.task_documentations.build
    group_id = current_user.groups.first.id
    @group_task_object = GroupTask.where("group_id = ? AND task_id = ?", group_id, @task.id).first
    @task_documentations = @group_task_object.task_documentations if @group_task_object
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :points, :requirements, :level, :avatar)
    end

    def admin
      redirect_to root_path unless current_user.admin == true
    end
end
