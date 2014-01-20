require 'spec_helper'

describe BatchCharity do
   describe "batch charity voting" do
      before :each do
      @batch = Batch.create
      @charity = Charity.create(:legal_name => "Cool Charity")
      @batch_charity = BatchCharity.create(:charity_id => @charity.id, :batch_id => @batch.id)
    end

    it "should allow votes for an open batch" do

    end

    it "should not allow votes for a closed batch" do
      @batch.close!
      BatchCharity.create(:charity_id => @charity.id, :batch_id => @batch.id)
      # should not allow new donation tied to this batch.
      @product = Product.create!(:name => "teaching of buddha")
      @purchase = Purchase.create(:product_id => @product.id)
      Donation.create!(:purchase_id => @purchase.id).should == "Exception"
      ## the donation does not concern self with the batch being closed...
    end

  end
end
