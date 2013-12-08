class CharityPayment < ActiveRecord::Base
  has_many :donations
  belongs_to :charity

  attr_accessible :payment_provider, :payment_reference, :state
end
