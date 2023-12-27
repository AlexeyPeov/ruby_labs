class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_sign_up_params, only: [:create]

  def create

    super

    if params[:user][:is_buyer] == 'true'
      Buyer.create(user: current_user)
    else
      Seller.create(user: current_user)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    # edit_user_registration_path
    '/users/edit'
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :is_buyer])
  end

  def update_resource(resource, params)
    resource.update_with_password(user_params)

    #
    # if params[:password].present?
    #   resource.update_with_password(user_params)
    # else
    #   resource.update_without_password(user_params)
    # end
  end

  private

  def user_params

    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :current_password,
      :password,
      :password_confirmation
    )

  end
end