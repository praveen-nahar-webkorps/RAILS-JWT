class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.string :name
      t.string :details
      t.references :buy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
