class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :username
      t.string :password
      t.integer :client_id

      t.timestamps
    end
  end
end
