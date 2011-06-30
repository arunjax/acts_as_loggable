class CreateRecentActivities < ActiveRecord::Migration
  def self.up
    create_table :recent_activities do |t|
      t.integer  :user_id,  :null => false
      t.integer  :activity_type, :null => false
      t.references :onobject, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :recent_activities
  end
end