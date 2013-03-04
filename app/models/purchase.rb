class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :buyer
  belongs_to :seller
  belongs_to :donation

  attr_accessible :stripe_card_token, :buyer_id, :product_id, :seller_id, :state, :donation_id, :id

  include Workflow
  workflow do
    state :physical_sale
    state :sold_online
    state :completed
  end

  validates_presence_of  :product_id

  def save_with_payment
  if valid?
    # email = params[user]['email']
    # customer = Stripe::Customer.create(description: email ,purchase_id: purchase_id,  card: stripe_card_token)
    customer = Stripe::Customer.create(description: self.product_id)
    self.stripe_card_token = customer.id
    # self.stripe_customer_token = customer.id
    save!
  end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
