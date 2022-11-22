class ChangeLocationFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :localization
    add_column :products, :city, :string
    add_column :products, :state, :string
  end
end
