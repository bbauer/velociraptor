class MilestonesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @client = Client.find params[:client_id]
    @milestones = @client.milestones
  end

  def show
    @client = Client.find params[:client_id]
  end

  def new
    @client = Client.find params[:client_id]
    @milestone = Milestone.new
  end

  def create
    @client = Client.find params[:client_id]
    @milestone = Milestone.new(milestone_params)
    @milestone.save
    redirect_to client_milestones_path(@client)
  end

  def destroy
    @client = Client.find params[:client_id]
    @milestone = Milestone.find(params[:id])
    @milestone.destroy
    redirect_to client_path(@client)
  end

private

  def milestone_params
    params.require(:milestone).permit(:title, :description, :status, :client_id, :user_id)
  end
end
