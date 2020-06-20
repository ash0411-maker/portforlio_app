# frozen_string_literal: true

class Devise::Guides::SessionsController < Devise::SessionsController
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
  def guide_guest
    guide = Guide.find(1)
    sign_in guide
    redirect_to guide_guide_home_top_path(current_guide), notice: 'ゲストユーザーとしてログインしました。'
  end
end
