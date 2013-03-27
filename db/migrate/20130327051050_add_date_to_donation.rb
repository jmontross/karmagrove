class AddDateToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :donation_date, :date
  end
end
