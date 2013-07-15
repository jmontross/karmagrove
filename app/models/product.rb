class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :id

  def pretty_price
    printf('%.2f', price)
  end
end
