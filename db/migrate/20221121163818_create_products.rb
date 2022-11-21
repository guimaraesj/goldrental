class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :min_rent_duration
      t.float :weight
      t.string :material
      t.float :product_price
      t.float :rent_cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
