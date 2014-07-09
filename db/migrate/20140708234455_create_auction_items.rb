class CreateAuctionItems < ActiveRecord::Migration
  def change
    create_table :auction_items do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.integer :starting_price

      t.timestamps
    end
  end
end
