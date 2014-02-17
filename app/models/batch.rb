class Batch < ActiveRecord::Base
  attr_accessible :batch_name, :sales, :state #, :product_ids #TODO = make this workflow state
  attr_accessible :batch_product_ids, :product_ids

  has_many :products, through: :batch_products
  has_many :batch_products

  has_many :batch_charities
  has_many :batch_charity_payments
  has_many :purchases

  # todo .. has many through ...
  # has_many_through :purchases batch_products

  include Workflow

  ##TODO Isn't there some validation we can add so it is only destroyable by its creator?

  workflow do
    state :open do
      event :close, transition_to: :closed
      event :cancel, transition_to: :cancelled
    end
    state :closed do
      event :cancel, transition_to: :cancelled
    end
    state :cancelled do
      event :resume, transition_to: :open
    end

    state :shipped
  end

  # pass params instead of all this junk and allow batch_charities to be created same time?
  # def initialize(arg1,arg2=nil)
  #   super(arg1,arg2)
  #   @batch = self
  #   self.state = "open"
  #   ## This is where we would default it to something more intelligent based on their location.
  #   self.batch_charity_ids = Charity.all(:limit => 3).map {|charity| BatchCharity.create(:batch_id => @batch.id, :charity_id => charity.id).charity_id }
  #   self.save!
  # end


  # def open
  #    self.state = "open"
  #    self.save
  # end


  def close
     @batch.state = "closed"
     @batch.save
  end

  def new_purchase(product_id)
    Purchase.new(:batch_id => self.id, :product_id => product_id)
  end

  def map_of_charities
    self.batch_charities
    #self.batch_charities<Ri do |charity|
    #  map_of_charities[charity.id] =0
    #end
  end

  def map_of_charity_ids
    @map_of_charities = {}
    self.batch_charities.each do |batch_charity|
        @map_of_charities[batch_charity.charity_id] =0
    end
    @map_of_charities
  end


  def calculate_charities_owed
   map_of_charity_ids = {}
   self.purchases.each do |purchase|
    if purchase.donation_id != nil
       if map_of_charity_ids[purchase.donation_id] == nil
        then map_of_charity_ids[purchase.donation_id] = 1
       else
          map_of_charity_ids[purchase.donation_id] += 1
       end
     end
   end
   map_of_charity_ids
  end

  def pay_charities
    map_of_charities_and_amounts = {}
    self.batch_charities.each do |charity|
      map_of_charities_and_amounts[charity.id] += 1
    end
    map_of_charities
  end


  # def close(allowed_to_close = true)
  #   # Let it close! ...
  #   self.state = self.current_state
  #   self.save
  #   halt unless allowed_to_close
  # end
end

