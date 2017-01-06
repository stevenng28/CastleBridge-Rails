class AddToggleTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :toggle_token, :string
  end
end
