class CreateBatchCharityPayments < ActiveRecord::Migration
  def change
    create_table :batch_charity_payments do |t|
      t.references :batch
      t.references :charity_payment

      t.timestamps
    end
    add_index :batch_charity_payments, :batch_id
    add_index :batch_charity_payments, :charity_payment_id
  end
end
