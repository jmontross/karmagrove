class Auction < ActiveRecord::Base
  belongs_to :market
  belongs_to :seller
  belongs_to :buyer
  belongs_to :auction_item
  attr_accessible :buy_now, :end_date, :published, :start_date
end
