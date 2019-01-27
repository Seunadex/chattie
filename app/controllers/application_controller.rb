class ApplicationController < ActionController::Base
  include ReactOnRails::Controller

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_all_users
  before_action :populate_default_mobx_stores, if: :user_signed_in?
  # skip_before_action :verify_authenticity_token

  helper_method def serialize_for_store(model_or_collection, options = {})
  return unless model_or_collection.present?

  return model_or_collection.map {|model| serialize_for_store(model, options)} if model_or_collection.respond_to?(:map)

  ActiveModelSerializers::SerializableResource.new(
    model_or_collection,
    scope: view_context,
    **options
  ).as_json
end

  def mobx_store(name, models, options = {})
    redux_store(name, props: {records: serialize_for_store(models, options)})
  end

  def populate_default_mobx_stores
    return unless current_user

    mobx_store("currentUser", current_user, serializer: CurrentUserSerializer)

  end

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
