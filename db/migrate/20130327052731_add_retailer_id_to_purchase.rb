class AddRetailerIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :retailer_id, :integer
  end
end
