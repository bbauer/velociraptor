class MilestonesController < ApplicationController
  before_filter :authenticate_user!

  add_breadcrumb "home", :root_path
  add_breadcrumb "campaign", :agency_campaign_path

  def index
    add_breadcrumb "milestones", :agency_campaign_milestones_path
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find params[:campaign_id]
    @milestones = @campaign.milestones
  end

  def show
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find params[:campaign_id]
  end

  def new
    @campaign = Campaign.find params[:campaign_id]
    @milestone = Milestone.new
  end

  def create
    @campaign = Campaign.find params[:campaign_id]
    Milestone.create!(milestone_params)

    redirect_to agency_campaign_milestones_path(@campaign.agency, @campaign)
  end

  def destroy
    @campaign = Campaign.find params[:campaign_id]
    Milestone.find(milestone_params).destroy

    redirect_to agency_campaign_milestones_path(@campaign.agency, @campaign)
  end

private

  def milestone_params
    params.require(:milestone).permit(:title, :description, :status, :campaign_id, :user_id)
  end
end
