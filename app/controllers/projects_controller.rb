class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!
  # GET /Projects
  # GET /Projects.json
 
  def home
    if current_user
      redirect_to projects_path
    end
  end

def body_html
auto_html(self[:body_html]) { simple_format; link(:target => 'blank') }
end

  def index
    @to_do = current_user.projects.where(stage: "to_do")
    @doing = current_user.projects.where(stage: "doing")
    @done = current_user.projects.where(stage: "done")
  end

  # GET /Projects/1
  # GET /Projects/1.json
  def show
  end

  # GET /Projects/new
  def new
    @project = Project.new
  end

  # GET /Projects/1/edit
  def edit
  end

  # POST /Projects
  # POST /Projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Projects/1
  # PATCH/PUT /Projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Projects/1
  # DELETE /Projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to Projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @project.update_attributes(stage: params[:stage])
    respond_to do |format| 
      format.html { redirect_to projects_path, notice: "project status successfully changed"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:content, :stage)
    end
end