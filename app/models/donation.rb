class Donation < ActiveRecord::Base
  belongs_to :purchase, :foreign_key => "donation_id"
  belongs_to :charity
  belongs_to :charity_payment

  attr_accessible :amount, :charity_id, :donation_id, :donation_date, :purchase_id
  #, :charity_payment_id
  
  def self.total_donations
  	total = 0
    Donation.all.each {|this| total += this.amount.to_i }
    return total
  end

end
