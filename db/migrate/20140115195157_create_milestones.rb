class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.string :description
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
