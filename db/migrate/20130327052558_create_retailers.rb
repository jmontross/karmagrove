class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
