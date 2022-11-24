class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :approval_state
    add_column :rents, :approval_state, :string, default: "None"
  end
end
