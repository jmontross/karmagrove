class AddStateToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :state, :string
  end
end
