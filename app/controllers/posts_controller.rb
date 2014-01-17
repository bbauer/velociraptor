class PostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to agency_campaign_path(@post.campaign.agency, @post.campaign)
    else
      redirect_to agency_campaign_path(@post.campaign.agency, @post.campaign)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to agency_campaign_path(@post.campaign.agency, @post.campaign)
  end

private

  def post_params
    params.require(:post).permit(:comment, :campaign_id, :user_id)
  end
end
