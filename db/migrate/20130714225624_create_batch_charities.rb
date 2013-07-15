class CreateBatchCharities < ActiveRecord::Migration
  def change
    create_table :batch_charities do |t|
      t.integer :batch_id
      t.integer :charity_id
      t.timestamps
    end
  end
end
