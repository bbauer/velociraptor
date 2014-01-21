class SocialAnalyticsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
    @posts = Source::SocialDataManager.new(@campaign).fetch_data
  end

  def refresh
    @campaign = Campaign.find(params[:campaign_id])
    Source::SocialDataManager.new(@campaign).refresh_data
    redirect_to agency_campaign_social_analytics_path(@campaign.agency, @campaign)
  end
end
