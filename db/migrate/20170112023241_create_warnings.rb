class CreateWarnings < ActiveRecord::Migration[5.0]
  def change
    create_table :warnings do |t|
      t.string :status
      t.boolean :suppressed, default: false
      t.string :suppressed_by
      t.integer :minutes_open, default: 0

      t.timestamps
    end
  end
end
