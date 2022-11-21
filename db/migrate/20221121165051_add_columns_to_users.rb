class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :localization, :string
  end
end
