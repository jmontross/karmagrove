class Batch < ActiveRecord::Base
  attr_accessible :batch_name, :sales, :state

  # workflow
  # states of closed, and then marked as processed by balanced process.
  #
end

