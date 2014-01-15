class AddClientIdToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :client_id, :integer
  end
end
