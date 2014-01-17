class AgenciesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_consultant!

  add_breadcrumb "home", :root_path

  def show
    @agency = Agency.find_by_slug(params[:id])
    add_breadcrumb @agency.name, :agency_path
    @consultants = @agency.users.where(level: "consultant")
  end

  def index
    redirect_to agency_path(current_user.agency)
  end
end
