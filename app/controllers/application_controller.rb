class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :authenticate_user!
  before_action :permit_device_parameters, if: :devise_controller?

  protected

  def permit_device_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :first_name, :middle_name, :last_name, :password, :password_confirmation)
    end
  end
end
