class AgenciesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_consultant!

  def show
    @agency = Agency.find_by_slug(params[:id])
    @consultants = @agency.users.where(level: "consultant")
  end

  def index
    redirect_to agency_path(current_user.agency)
  end
end
