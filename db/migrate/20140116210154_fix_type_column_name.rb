class FixTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :type, :level
  end
end
