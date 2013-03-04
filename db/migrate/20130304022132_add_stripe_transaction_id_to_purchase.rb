class AddStripeTransactionIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :stripe_transaction_id, :string
  end
end
