class BatchMaker < ActiveRecord::Base
  attr_accessible :weight, :user_id, :batch_id, :user_type
end
