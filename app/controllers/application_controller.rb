class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_all_users
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i(username email password password_confirmation remember_me)
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def get_all_users
    @users = User.get_users
  end
end
