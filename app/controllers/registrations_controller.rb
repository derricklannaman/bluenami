class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(sign_up_params)
    org_id = Organization.first.id #TODO: this is based on link/access code from org
    user.organization_id = org_id
    if user.save
      after_sign_up_path_for(user)
    else
      redirect_to new_user_registration_path
    end
  end

  protected

    def after_sign_up_path_for(resource)
      # TODO: the only way to signup will be through a link/ or access code
      binding.pry
      redirect_to root_path
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :organization_id)
    end
end