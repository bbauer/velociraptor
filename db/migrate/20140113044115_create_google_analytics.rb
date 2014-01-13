class CreateGoogleAnalytics < ActiveRecord::Migration
  def change
    create_table :google_analytics do |t|
      t.integer :client_id
      t.string :email
      t.string :password
      t.string :profile_id

      t.timestamps
    end
  end
end
