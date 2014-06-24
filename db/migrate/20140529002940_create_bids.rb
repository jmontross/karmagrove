class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :auction
      t.integer :amount

      t.timestamps
    end
    add_index :bids, :auction_id
  end
end
