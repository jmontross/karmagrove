class Bid < ActiveRecord::Base
  belongs_to :auction
  attr_accessible :amount
end
