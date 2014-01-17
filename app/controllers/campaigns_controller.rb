class CampaignsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    redirect_to agency_path(@agency)
  end

  def show
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:id])

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
