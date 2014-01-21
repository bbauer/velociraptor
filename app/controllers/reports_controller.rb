class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
  end

  def show
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
  end
end
