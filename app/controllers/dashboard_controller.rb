class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @posts = @client.posts
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
