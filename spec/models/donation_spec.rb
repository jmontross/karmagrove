require 'spec_helper'

describe Donation do
  before do
    @batch = Batch.create(:batch_name => "test karma coin batch")
    @product = Product.create(:name => "Karma Coin")
  end
  it "should allow donation for a batch that is open" do
    purchase = @batch.new_purchase(@product.id)
    donation = Donation.create(:purchase_id => purchase.id, :charity_id => 1006721, :amount => 200)
    ## the donation should exist...
    donation == donation
  end

  it "should not allow donation for a batch that is closed" do
    @batch.close
    purchase = @batch.new_purchase(@product.id)
    donation = Donation.create(:purchase_id => purchase.id, :charity_id => 1006721, :amount => 200)
    purchase == false
  end

end
