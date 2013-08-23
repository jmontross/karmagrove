class CreateBatchUsers < ActiveRecord::Migration
  def change
    create_table :batch_users do |t|
      t.references :user_id
      t.references :batch_id
      t.string :user_type
      t.float :weight
      t.timestamps
    end
  end
end
