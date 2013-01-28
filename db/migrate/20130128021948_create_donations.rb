class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :purchase
      t.references :charity
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :donations, :purchase_id
    add_index :donations, :charity_id
  end
end
