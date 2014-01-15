class HomeController < ApplicationController
  def index
    redirect_to client_path(current_user.client) if user_signed_in?
  end
end
