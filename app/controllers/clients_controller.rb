class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def show
    if params[:id]
      @client = Client.find(params[:id])
      @posts = @client.posts
    else
      redirect_to client_path(current_user.client)
    end
  end
end
