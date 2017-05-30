class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.where(project_id = params[:project_id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
