class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :id, :image_url


  def description_display
  	if self.description.nil?
  		return "the name says it all"
  	end
  	self.description
  end
  def pretty_price
    printf('%.2f', price)
  end
end
