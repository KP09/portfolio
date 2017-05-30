class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # TEMPORARY
    @contributions = Contribution.all
  end
end
