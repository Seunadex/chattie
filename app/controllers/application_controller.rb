class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_all_users
  # skip_before_action :verify_authenticity_token

  protected

  def configure_permitted_parameters
    login_attrs = %i(username email password password_confirmation remember_me)
    sign_up_attrs = %i(
      username
      first_name
      last_name
      qoute
      job_description
      email
      password
      password_confirmation
      remember_me
    )
    devise_parameter_sanitizer.permit :sign_in, keys: login_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_attrs
    devise_parameter_sanitizer.permit :account_update, keys: sign_up_attrs
  end

  def get_all_users
    @users = User.get_users
  end
end
