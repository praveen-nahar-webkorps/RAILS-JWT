class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.string :about
      t.integer :price
      t.integer :phone_no
      t.string :landmark
      t.string :property_type
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
