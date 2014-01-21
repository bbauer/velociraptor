class SocialAnalyticsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def index
    @agency = Agency.find_by_slug(params[:agency_id])
    @campaign = Campaign.find(params[:campaign_id])
    @posts = Source::SocialFetcher.new(@campaign).fetch
    @twitter = posts_for("Twitter")
    @google_plus = posts_for("Google Plus")
    @facebook = posts_for("Facebook")
  end

protected

  def posts_for(source)
    @posts.select { |post| post.source == source }
  end
end
