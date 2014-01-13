class BatchCharity < ActiveRecord::Base
  attr_accessible :batch_id, :charity_id

  def perform
  # logic for finding the batch if it is closed,
  # and then paying each charity by summing all the amounts owed to that charity from different batches
  end

end
