class BatchCharityPayment < ActiveRecord::Base
  belongs_to :batch
  belongs_to :charity_payment

  # attr_accessible :title, :body
end
