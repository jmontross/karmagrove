class BatchProduct < ActiveRecord::Base

  belongs_to :batch
  belongs_to :product

  attr_accessible :product_id, :batch_id
end
