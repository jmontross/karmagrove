class ProductCharity < ActiveRecord::Base
  belongs_to :product
  belongs_to :charity
  # attr_accessible :title, :body
end
