class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def do_tasks
    @tasks = current_user.get_tasks 1 
  end

  def request_tasks
    #@condition = {}
    #@condition[:orgnization] = current_user.orginization unless current_user.orgnization == User::ORGS[0]
    #@condition[:status] = params[:status] if params[:status] and User::STATUS.include? params[:status]
    #params[:number]
    #@tasks = current_user.reuqest_new_tasks params[:number]
  end

  def submit_task
    #Rails.logger.info "***************"
    #Rails.logger.info task_params
    tparams = task_params
    @task = Task.find(tparams[:task_id])
    tparams.delete :task_id
    #Rails.logger.info @task
    @task.update(tparams)
    @task = current_user.request_new_tasks[0]
    respond_to do |format|
      format.html {
        #byebug
        redirect_to @task, notice: 'Task was successfully updated.' 
      }
      #format.json { render :show, status: :ok, location: @ntask }
      format.json { 
        render :json => @task
        #render :show, status: :ok, location: @task 
      }
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
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
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
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
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
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
      params.require(:task).permit(:task_id, :owner_id, :request_at, :finish_at, :result, :check_result, :checker_id, :check_at, :url, :number)
    end
end
