class AddProfitAndRevenuePercentagesToPurchase < ActiveRecord::Migration
  def change
  	 add_column :purchases, :revenue_donation_percent, :integer
  	 add_column :purchases, :profit_donation_percent, :integer 
  end
end
