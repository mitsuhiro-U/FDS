# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
      if @user == nil
        redirect_to new_user_session_path
      elsif
        @user.valid_password?(params[:user][:password]) && !@user.is_active
        redirect_to new_user_session_path
      end
  end

end
