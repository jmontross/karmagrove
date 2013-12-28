class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :country
      t.string :state
      t.string :county
      t.string :district
      t.string :intersection
      t.string :address

      t.timestamps
    end
  end
end
