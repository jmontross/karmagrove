class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product
      t.references :buyer
      t.references :seller
      t.references :donation
      t.timestamps
    end
    add_index :purchases, :product_id
    add_index :purchases, :donation_id
    add_index :purchases, :buyer_id
    add_index :purchases, :seller_id
  end
end
