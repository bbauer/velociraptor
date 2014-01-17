class CampaignsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  add_breadcrumb "home", :root_path

  def index
    add_breadcrumb "campaigns", :agency_campaigns_path

    @agency = Agency.find_by_slug(params[:agency_id])

    redirect_to agency_path(@agency)
  end

  def show
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:id])

    add_breadcrumb @campaign.name, :agency_campaign_path

    if @campaign.agency != agency
      redirect_to agency_path(@agency)
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to agency_path(@agency)
  end

protected

  def check_permission
    if client && current_user.campaign_id != params[:id].to_i
      redirect_to agency_campaign_path(agency, campaign)
    end
  end
end
