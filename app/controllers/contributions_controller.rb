class ContributionsController < ApplicationController
  def index
    @contributions = Project.find(params[:project_id]).contributions
  end

  def create
  	@contribution = Contribution.new(contribution_params)
  	@participation = Participation.find(params[:participation_id])
    @contribution.participation = @participation
  	if @contribution.save
  	  redirect_to root_path
  	else
  	  render :new
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


