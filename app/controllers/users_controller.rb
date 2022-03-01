class UsersController < ApplicationController
  include Administration
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]
  
  def index
    @users = User.all
  end

  def edit
    if @user.id != current_user.id && !current_user.superadmin?
      redirect_to root_path, alert: "You are not authorized to do that action" 
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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


  def user_params
    params.require(:user).permit(:email, :password, :role, :password_confirmation, :name, :surname)
  end
end
