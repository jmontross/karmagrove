class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.integer :ein
      t.string :legal_name
      t.string :city
      t.string :state
      t.string :deductibility_status
      t.string :country
      t.string :deductibility_status_description

      t.timestamps
    end
  end
end
