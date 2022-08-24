class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  include Pundit::Authorization
  include Pagy::Backend
  
  #after_action :verify_authorized
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::InvalidForeignKey, with: :containts_resources

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  private
    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end

    def containts_resources
      flash[:alert] = 'You can not delete this record. It has related resources or attachments.'
      redirect_to root_path
    end
end
