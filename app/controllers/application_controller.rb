class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

    def authenticate_user_organization
      return if !current_user.present?
      if current_user.organization_id != @org_id
        redirect_to dashboard_path(current_user.organization_id)
      end
    end

end
