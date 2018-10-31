class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_title
      t.text :description
      t.decimal :price
      t.string :medium
      t.integer :quantity
      t.string :creator
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
