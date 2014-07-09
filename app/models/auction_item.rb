class AuctionItem < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :starting_price
end
