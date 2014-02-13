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

  it "should all a purchase to have a donation associated" do
     @fancy_batch = Batch.create!

     @charity =  Charity.create!(:legal_name =>"grind out hunger")
     @charity2 = Charity.create!(:legal_name =>"grey bears")
     @charity3 = Charity.create!(:legal_name =>"second harvest")

     @batch_charity =  BatchCharity.create!(:charity_id=>@charity.id,:batch_id => @fancy_batch.id)
     @batch_charity2 = BatchCharity.create!(:charity_id=>@charity2.id,:batch_id => @fancy_batch.id)
     @batch_charity3 = BatchCharity.create!(:charity_id=>@charity3.id,:batch_id => @fancy_batch.id)
     @fancy_batch.batch_charities = [@batch_charity,@batch_charity2,@batch_charity3]
     @fancy_batch.save!
     @product = Product.create!(:name => "teaching of buddha text")
     # @batch.calculate_charities_owed.should.sort.eql? {@charity
     @purchase = Purchase.create!(:batch_id => @fancy_batch.id, :product_id=>@product.id)
     @purchase.new_donation(:charity_id => @charity.id)

     @purchase = Purchase.create!(:batch_id => @fancy_batch.id, :product_id=>@product.id)
     @purchase.new_donation(:charity_id => @charity2.id)

     @purchase = Purchase.create!(:batch_id => @fancy_batch.id, :product_id=>@product.id)
     @purchase.new_donation(:charity_id => @charity2.id)
     @purchase.donation_id.should_not == nil
  end

end
