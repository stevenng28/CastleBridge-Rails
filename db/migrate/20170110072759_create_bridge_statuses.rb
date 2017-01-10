class CreateBridgeStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_statuses do |t|
      t.datetime :closed
      t.datetime :open
      t.datetime :closing
      t.datetime :opening

      t.timestamps
    end
  end
end
