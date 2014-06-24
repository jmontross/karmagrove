class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :market
      t.references :seller
      t.references :buyer
      t.references :auction_item
      t.boolean :buy_now
      t.boolean :published

      t.timestamps
    end
    add_index :auctions, :market_id
    add_index :auctions, :seller_id
    add_index :auctions, :buyer_id
    add_index :auctions, :auction_item_id
  end
end
