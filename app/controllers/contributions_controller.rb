class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.where(project_id = params[:project_id])
  end

  def create
  	@contribution = Contribution.new(contribution_params)

  	@contribution.participation.user = current_user
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

end
