class Donation < ActiveRecord::Base
  belongs_to :purchase, :foreign_key => "donation_id"
  belongs_to :charity
  belongs_to :charity_payment

  attr_accessible :amount, :charity_id, :donation_id, :donation_date, :purchase_id, :charity_payment_id



end
