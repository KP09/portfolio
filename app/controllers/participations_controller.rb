class ParticipationsController < ApplicationController
  def create
    @current_user = current_user
    @participation = Participation.new(participation_params)
    @participation.user_id = current_user.id
    if @participation.save
      redirect_to project_path(@participation.project_id)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def participation_params
    params.require(:Participation).permit(:project_id)
  end

end
