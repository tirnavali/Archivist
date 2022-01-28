# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  prepend_before_action :require_no_authentication, only: [ :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    puts "bi bor byapma"
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def require_no_authentication
    # assert_is_devise_resource!
    # return unless is_navigational_format?
    # no_input = devise_mapping.no_input_strategies

    # authenticated = if no_input.present?
    #   args = no_input.dup.push scope: resource_name
    #   warden.authenticate?(*args)
    # else
    #   warden.authenticated?(resource_name)
    # end

    # if authenticated && resource = warden.user(resource_name)
    #   set_flash_message(:alert, 'already_authenticated', scope: 'devise.failure')
    #   redirect_to after_sign_in_path_for(resource)
    # end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
