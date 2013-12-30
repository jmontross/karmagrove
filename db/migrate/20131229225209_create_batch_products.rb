class CreateBatchProducts < ActiveRecord::Migration
  def change
    create_table :batch_products do |t|
      t.references :batch
      t.references :product

      t.timestamps
    end
    add_index :batch_products, :batch_id
    add_index :batch_products, :product_id
  end
end
