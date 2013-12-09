class CreateCharityPayments < ActiveRecord::Migration
  def change
    create_table :charity_payments do |t|
      t.integer :payment_reference
      t.string :payment_provider
      t.references :charity
      t.string :state
      t.integer :amount
      t.timestamps
    end

    add_index :charity_payments, :charity_id
  end
end
