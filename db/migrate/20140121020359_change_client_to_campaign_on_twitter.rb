class ChangeClientToCampaignOnTwitter < ActiveRecord::Migration
  def change
    rename_column :twitters, :client_id, :campaign_id
  end
end
