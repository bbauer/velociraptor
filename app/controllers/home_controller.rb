class HomeController < ApplicationController
  def index
    redirect_to agency_path(current_user.agency) if user_signed_in?
  end
end
