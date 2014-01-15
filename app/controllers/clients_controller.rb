class ClientsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_permission

  def show
    @client = Client.find(id)
    @posts = @client.posts
  end

protected

  def check_permission
    unless current_user.admin || client.id == id
      redirect_to client_path(client)
    end
  end

  def client
    current_user.client
  end

  def id
    params[:id].to_i
  end
end
