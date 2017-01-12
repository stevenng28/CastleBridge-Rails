class AddDefaultsToBridgeStatuses < ActiveRecord::Migration[5.0]
  def up
    change_column :bridge_statuses, :open, :datetime, :default => Time.now
    change_column :bridge_statuses, :closed, :datetime, :default => Time.now
    change_column :bridge_statuses, :opening, :datetime, :default => Time.now
    change_column :bridge_statuses, :closing, :datetime, :default => Time.now
  end
  
  def down
    change_column :bridge_statuses, :open, :datetime, :default => nil
    change_column :bridge_statuses, :closed, :datetime, :default => nil
    change_column :bridge_statuses, :opening, :datetime, :default => nil
    change_column :bridge_statuses, :closing, :datetime, :default => nil
  end
end
