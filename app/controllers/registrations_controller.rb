class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :quote, :job_description, :password, :password_confirmation, :remember_me)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :quote, :job_description, :password, :password_confirmation, :current_password, :remember_me)
  end

end
