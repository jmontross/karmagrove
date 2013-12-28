class Market < ActiveRecord::Base
  attr_accessible :address, :country, :county, :district, :intersection, :state
end
