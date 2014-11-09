class Gift < Purchase
  has_many :purchases, :foreign_key => "seller_id"
  # attr_accessible :title, :body
  attr_accessor :total_costs, :costs, :purchase_prices

  def total_cost_of_sales
    costs = self.purchases.map(&:cost)
    self.total_costs = costs.inject{|sum, cost| sum + cost}.to_f
  end

  def list_costs
    self.costs = self.purchases.map(&:cost)
  end

  def list_purchase_prices
    self.purchase_prices = self.purchases.map(&:final_purchase_price)
  end

  def total_revenue
    self.purchase_prices.inject{|sum, purchase_price| sum + purchase_price}.to_f
  end

  def total_profits
    if self.total_costs.nil?
      self.total_cost_of_sales
    end
    self.total_costs
  end
end
