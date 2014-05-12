class CreateProductCharities < ActiveRecord::Migration
  def change
    create_table :product_charities do |t|
      t.references :product
      t.references :charity

      t.timestamps
    end
    add_index :product_charities, :product_id
    add_index :product_charities, :charity_id
  end
end
