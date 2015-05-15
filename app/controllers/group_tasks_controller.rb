class GroupTasksController < ApplicationController
  before_action :set_group_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin

  # GET /group_tasks
  # GET /group_tasks.json
  def index
    @group_tasks = GroupTask.all
  end

  # GET /group_tasks/1
  # GET /group_tasks/1.json
  def show
  end

  # GET /group_tasks/new
  def new
    @group_task = GroupTask.new
  end

  # GET /group_tasks/1/edit
  def edit
  end

  # POST /group_tasks
  # POST /group_tasks.json
  def create
    @group_task = GroupTask.where(:group_id => params[:group_task][:group_id], task_id: params[:group_task][:task_id]).first_or_create do |group_task|
      # This block is called with a new user object with only :email set
      # Customize this object to your will
      #group_task.attributes = params[:group_task][:task_documentations_attributes]
      # After this, first_or_create will call user.create, so you don't have to
    end
    params[:group_task][:task_documentations_attributes].each do |s|        
      TaskDocumentation.create(
        description: s[1][:description], 
        image: s[1][:image], 
        group_task_id: @group_task.id
      )
    end

    redirect_to :back

  end

  # PATCH/PUT /group_tasks/1
  # PATCH/PUT /group_tasks/1.json
  def update
    respond_to do |format|
      if @group_task.update(group_task_params)
        format.html { redirect_to @group_task, notice: 'Group task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_tasks/1
  # DELETE /group_tasks/1.json
  def destroy
    @group_task.destroy
    respond_to do |format|
      format.html { redirect_to group_tasks_url }
      format.json { head :no_content }
    end
  end

  private

    def admin
      redirect_to root_path unless current_user.admin == true
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group_task
      @group_task = GroupTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_task_params
      params.require(:group_task).permit(:group_id, :task_id, task_documentations_attributes: [:id, :description, :user_id, :_destroy, :image, :group_task_id])
    end
end
