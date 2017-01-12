class AddMorningNotifyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :morning_notify, :boolean, default: false
  end
end
