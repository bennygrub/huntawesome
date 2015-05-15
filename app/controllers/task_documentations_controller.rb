class TaskDocumentationsController < ApplicationController
  before_action :set_task_documentation, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin

  # GET /task_documentations
  # GET /task_documentations.json
  def index
    @task_documentations = TaskDocumentation.all
  end

  # GET /task_documentations/1
  # GET /task_documentations/1.json
  def show
  end

  # GET /task_documentations/new
  def new
    @task_documentation = TaskDocumentation.new
  end

  # GET /task_documentations/1/edit
  def edit
  end

  # POST /task_documentations
  # POST /task_documentations.json
  def create
    @task_documentation = TaskDocumentation.new(task_documentation_params)

    respond_to do |format|
      if @task_documentation.save
        format.html { redirect_to @task_documentation, notice: 'Task documentation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_documentation }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_documentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_documentations/1
  # PATCH/PUT /task_documentations/1.json
  def update
    respond_to do |format|
      if @task_documentation.update(task_documentation_params)
        format.html { redirect_to @task_documentation, notice: 'Task documentation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_documentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_documentations/1
  # DELETE /task_documentations/1.json
  def destroy
    @task_documentation.destroy
    respond_to do |format|
      format.html { redirect_to task_documentations_url }
      format.json { head :no_content }
    end
  end

  private

    def admin
      redirect_to root_path unless current_user.admin == true
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task_documentation
      @task_documentation = TaskDocumentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_documentation_params
      params.require(:task_documentation).permit(:description)
    end
end
