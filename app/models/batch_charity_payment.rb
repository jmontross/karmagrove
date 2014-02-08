class BatchCharityPayment < ActiveRecord::Base
  attr_accessible :charity_payment_id, :batch_id

  belongs_to :batch
  belongs_to :charity_payment

  # attr_accessible :title, :body
  def self.closed_batches
    closed_batches = Batch.where(:state => "closed")
    closed_batches.each do |batch|
      # BatchCharityPayment.create(:batch_id => batch.id)
      # Then it creates little items for each charitypayment needed and tosses into our queue?.. i dont know.
      # TODO .. figure out better this workflow... probably move to more abstract model in future
      # CharityPatment.create(
    end
    return closed_batches
  end



  def self.open_batches
    open_batches = Batch.where(:state => "open")
    open_batches.each do |batch|
      # BatchCharityPayment.create(:batch_id => batch.id)
      # Then it creates little items for each charitypayment needed and tosses into our queue?.. i dont know.
      # TODO .. figure out better this workflow... probably move to more abstract model in future
      # CharityPatment.create(
    end
    return open_batches
  end

  def process
    return "success"
  end

  def open_batches
    return self.batches.where(:status => "open")
  end

  def open_batches
    return self.batches.where(:status => "closed")
  end

end
