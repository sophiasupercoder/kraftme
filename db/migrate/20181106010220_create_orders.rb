class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :product, foreign_key: true
      t.string :product_title
      t.string :quantity
      t.string :price
      t.references :buyer
      t.references :seller
      t.timestamps
    end
    
    add_foreign_key :orders, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :orders, :users, column: :seller_id, primary_key: :id
  end
end
