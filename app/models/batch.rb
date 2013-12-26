class Batch < ActiveRecord::Base
  attr_accessible :batch_name, :sales, :workflow_state, :state
  include Workflow

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

  def initialize(arg1,arg2=nil)
    super(arg1,arg2)
    @batch = self
    self.state = "open"
    self.save
  end

  def close
     @batch.state = "closed"
     @batch.save
  end

  def new_purchase(product_id)
    Purchase.new(:batch_id => self.id, :product_id => product_id)
  end

  # def close(allowed_to_close = true)
  #   # Let it close! ...
  #   self.state = self.current_state
  #   self.save
  #   halt unless allowed_to_close
  # end
end

