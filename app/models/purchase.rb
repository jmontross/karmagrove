class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :buyer
  belongs_to :seller
  belongs_to :donation

  attr_accessible :buyer_id, :product_id, :seller_id, :state, :donation_id

  include Workflow
  workflow do
    state :physical_sale
    state :sold_online
    state :completed
  end


end
