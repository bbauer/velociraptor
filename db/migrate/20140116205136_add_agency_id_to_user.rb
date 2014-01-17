class AddAgencyIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :agency_id, :integer
    add_column :users, :campaign_id, :integer
  end
end
