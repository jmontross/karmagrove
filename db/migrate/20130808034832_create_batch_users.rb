class CreateBatchUsers < ActiveRecord::Migration
  def change
    create_table :batch_users do |t|
      t.foreign_key :user_id
      t.foreign_key :batch_id
      t.string :user_type
      t.float :weight
      t.timestamps
    end
  end
end
