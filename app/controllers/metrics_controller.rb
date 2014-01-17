class MetricsController < ApplicationController
  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
  end
end
