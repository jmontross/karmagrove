class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :buyer
  belongs_to :seller
  belongs_to :donation

  attr_accessible :buyer_id, :product_id, :seller_id
end
