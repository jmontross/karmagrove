class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :buyer
  belongs_to :seller
  belongs_to :donation
  belongs_to :batch

  attr_accessible :stripe_customer_token, :buyer_id, :product_id,
                  :seller_id, :state, :donation_id, :id, :stripe_transaction_id, :retailer_id,
                  :batch_id, :cost, :purchase_price

  ## final purchase price is for auction only....

  ## Validate here that the batch is not closed before allowing a purchase of a batch that is done....

  include Workflow
  workflow do
    state :physical_sale
    state :sold_online
    state :completed
  end


 # TODO - does this make sense?  to ahndle here in intialize?  RYAN?
 # def initialize(arg1=nil,arg2=nil)
 #   super(arg1,arg2)
 #   @purchase = self
 #   @purchase.state = "open"
 #   @purchase.save
 #   # @purch
 #   if @purchase.batch_id and @batch = Batch.find(@purchase.batch_id) and @batch.state == "closed"
 #     puts @batch.state
 #     @purchase.state = "invalid-batch-cancelled"
 #     @purchase.save
 #     @response = false
 #     return false
 #   else
 #     @response =self
 #     return self
 #   end
 #   @response
 # end

  validates_presence_of  :product_id

  def save_with_payment(params={})
    begin
      if valid?
        # email = params[user]['email']
          # customer = Stripe::Customer.create(description: email ,purchase_id: purchase_id,  card: stripe_card_token)
        customer = Stripe::Customer.create(description: self.product_id)
        self.stripe_customer_token = customer.id
        if params[:purchase_id]
          self.stripe_transaction_id = params[:purchase_id]
        else
          self.stripe_transaction_id = customer.id  
        end
        
        # self.stripe_customer_token = customer.id
        save!
      end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
  end

  def new_donation(params)
    if params[:charity_id]
      @charity_id = params[:charity_id]
    else
      # bad workaround - just makeup a charity..
      @charity_id = Charity.first.id
    end
    @donation = Donation.create!(:charity_id => @charity_id, :purchase_id => self.id)
    self.donation_id = @donation.id
    # @donation.save
    return @donation
  end

end
