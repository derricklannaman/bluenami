module ApplicationHelper

  def organization_name
    current_user.organization.name
  end

end
