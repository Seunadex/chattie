class RegistrationsController < Devise::RegistrationsController
  # before_action :sign_up_params, only: [:create]
  # before_action :account_update_params, only: [:update]

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :qoute, :job_description, :password, :password_confirmation, :remember_me)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :qoute, :job_description, :password, :password_confirmation, :current_password, :remember_me)
  end

end
