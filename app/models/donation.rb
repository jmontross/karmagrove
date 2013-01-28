class Donation < ActiveRecord::Base
  belongs_to :purchase, :foreign_key => "donation_id"
  belongs_to :charity

  attr_accessible :amount

end
