class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.float :sales

      t.timestamps
    end
  end
end
