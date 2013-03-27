class Retailer < ActiveRecord::Base
  has_many :purchases

  attr_accessible :address, :description, :name
end
