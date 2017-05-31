class ContributionsController < ApplicationController
  def index
    @contributions = Project.find(params[:project_id]).contributions
  end

  def create
  end

  def update
  end

  def destroy
  end

end
