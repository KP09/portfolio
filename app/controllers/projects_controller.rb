class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:term].blank?
      @projects = Project.all
    else
      @projects = Project.where("title iLIKE :term OR category iLIKE :term", term: "%#{params[:term]}%")
    end
  end

  def show
    @project = Project.find(params[:id])
    @current_user = current_user
    @contribution = Contribution.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end


  private

  def project_params
    params.require(:project).permit(:title, :brief, :category, :end_date, :max_joins)
  end

end
