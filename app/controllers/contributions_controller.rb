class ContributionsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @contributions = Project.find(@project.id).contributions
  end

  def create
  	@contribution = Contribution.new(contribution_params)
  	@participation = Participation.find(params[:participation_id])
    @current_user = current_user
    @project = @participation.project
    @contribution.participation = @participation
  	if @contribution.save
  	  redirect_to project_path(@participation.project)
  	else
  	  render 'projects/show'
  	end
  end

  def update
  end

  def destroy
  end


  private

	def contribution_params
    params.require(:contribution).permit(:file, :comment)
  end

end


