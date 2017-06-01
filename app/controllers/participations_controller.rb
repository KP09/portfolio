class ParticipationsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @participation = Participation.new
    @participation.project = @project
    @participation.user = current_user
    if @participation.save
      redirect_to project_path(@participation.project_id)
    else
      render :new
    end
  end

  def destroy
    @project = Participation.find(params[:id]).project
    Participation.find(params[:id]).destroy
    redirect_to project_path(@project)

  end

  private

  def participation_params
    params.require(:participation).permit(:project_id)
  end

end
