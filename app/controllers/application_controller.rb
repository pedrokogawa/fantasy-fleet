class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :nickname, :license_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :nickname, :license_number])
  end

  # Redirect to vehicle page or default to root_path
  def after_sign_in_path_for(resource)
    redirect_url = vehicle_path(:redirect_id) || root_path
    redirect_url
  end

end
