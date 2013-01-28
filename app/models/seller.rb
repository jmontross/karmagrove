class Seller < User
  has_many :purchases, :foreign_key => "seller_id"
  # attr_accessible :title, :body
end
