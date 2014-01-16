class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :slug
      t.string :agency_id

      t.timestamps
    end
  end
end
