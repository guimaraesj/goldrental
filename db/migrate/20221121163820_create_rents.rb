class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.float :total_value
      t.integer :duration
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :approval_state
      t.string :credit_card

      t.timestamps
    end
  end
end
