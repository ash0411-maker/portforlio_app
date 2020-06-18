# frozen_string_literal: true

class Devise::Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def admin_guest
    admin = Admin.find(1)
    sign_in admin
    redirect_to admin_home_top_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
