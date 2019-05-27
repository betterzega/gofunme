class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :department, :team, :started_on, :level])
  end
end
