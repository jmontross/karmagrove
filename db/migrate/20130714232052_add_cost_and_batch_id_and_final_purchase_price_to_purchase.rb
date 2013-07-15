class AddCostAndBatchIdAndFinalPurchasePriceToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :batch_id, :integer
    add_column :purchases, :purchase_price, :float
    add_column :purchases, :cost, :float
  end
end
