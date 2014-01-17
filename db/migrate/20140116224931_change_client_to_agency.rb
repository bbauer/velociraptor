class ChangeClientToAgency < ActiveRecord::Migration
  def change
    rename_column :posts, :client_id, :campaign_id
    rename_column :milestones, :client_id, :campaign_id
  end
end
