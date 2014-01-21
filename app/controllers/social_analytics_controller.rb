class SocialAnalyticsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
    @posts = posts
    @twitter = posts_for("Twitter")
    @google_plus = posts_for("Google Plus")
    @facebook = posts_for("Facebook")
  end

protected

  def posts
    if cached_data = Rails.cache.read("#{campaign.id}_social_posts")
      cached_data
    else
      data = Source::SocialAggregator.new(@campaign).aggregate
      Rails.cache.write("#{campaign.id}_social_posts", data, expires_in: 3.hours)
      Rails.cache.read("#{campaign.id}_social_posts")
    end
  end

  def posts_for(source)
    @posts.select { |post| post.source == source }
  end

  def check_permission
    if client && current_user.campaign_id != params[:id].to_i
      redirect_to agency_campaign_path(agency, campaign)
    end
  end
end
