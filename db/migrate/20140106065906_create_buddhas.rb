class CreateBuddhas < ActiveRecord::Migration
  def change
    create_table :buddhas do |t|
      t.references :product
      t.string :file_location
      t.string :media_type

      t.timestamps
    end
  end
end
