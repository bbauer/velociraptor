class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

  def after_sign_in_path_for(resource)
    return agency_campaign_path(agency, campaign) if client
    stored_location_for(resource) || agency_path(agency)
  end

  def authenticate_admin!
    redirect_to agency_path(agency) unless current_user.admin
  end

  def authenticate_consultant!
    if client
      redirect_to agency_campaign_path(agency, campaign)
    end
  end

  def client
    current_user.level == "client"
  end

  def agency
    current_user.agency if current_user
  end

  def campaign
    Campaign.find(current_user.campaign_id) if current_user
  end
end
