class ReportsController < ApplicationController
  def index
    @client = Client.find params[:client_id]
  end

  def show
    @client = Client.find params[:client_id]
  end
end
