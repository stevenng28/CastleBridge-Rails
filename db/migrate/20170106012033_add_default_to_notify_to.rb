class AddDefaultToNotifyTo < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :notify_to, :boolean, default: false
  end

  def down
    change_column :users, :notify_to, :boolean, default: nil
  end
end
