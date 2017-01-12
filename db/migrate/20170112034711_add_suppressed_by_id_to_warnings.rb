class AddSuppressedByIdToWarnings < ActiveRecord::Migration[5.0]
  def change
    add_column :warnings, :suppressed_by_id, :integer
  end
end
