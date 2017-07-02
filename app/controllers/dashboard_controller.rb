class DashboardController < ApplicationController
  before_action :find_organization_id, :authenticate_user_organization

  def show
    current_dashboard
  end

  private

    def find_organization_id
      @org_id = current_user.organization_id if current_user
    end

    def current_dashboard
      @dashboard = Organization.find(@org_id).dashboard if current_user
    end

end
