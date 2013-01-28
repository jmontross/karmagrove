class AddStateToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :state, :string
  end
end
