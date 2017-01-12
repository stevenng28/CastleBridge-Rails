class RemoveSuppressedByFromWarnings < ActiveRecord::Migration[5.0]
  def change
    remove_column :warnings, :suppressed_by
  end
end
