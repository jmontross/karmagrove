require 'spec_helper'

describe Purchase do
  before do
    @product = Product.create!({
      :name => "Karma Coin",
      :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
      :price => "2.00",
      :image_url => "/assets/karma_coin_hand.gif"
    })
  end

  it "should allow purchase of a product" do
    @purchase = Purchase.create(:product_id => @product.id)
    @purchase.product.image_url.should == "/assets/karma_coin_hand.gif"

  end

end
