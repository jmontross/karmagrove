class Buyer < User
  has_many :purchases, :foreign_key => "buyer_id"
  # attr_accessible :title, :body
end
