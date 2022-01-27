class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def index
    @users = User.all
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end 
  end

  private 
  def set_user
    @user = User.find(params[:id])
  end
end
