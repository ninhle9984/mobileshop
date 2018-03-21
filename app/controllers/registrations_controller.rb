class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end

  def account_update_params
    params.require(:user).permit User::UPDATE_PARAMS
  end
end
