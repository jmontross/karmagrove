class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :id
end
