class Donation < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :charity
  attr_accessible :amount
end
