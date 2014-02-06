require 'spec_helper'

describe BatchCharity do

   describe "batch charity voting" do
      before :each do
      @batch = Batch.create
      @charity = Charity.create(:legal_name => "Cool Charity")
      @batch_charity = BatchCharity.create(:charity_id => @charity.id, :batch_id => @batch.id)
    end

    it "should allow votes for an open batch" do
      @product = Product.create!(:name => "teaching of buddha")
      @purchase = Purchase.create(:product_id => @product.id,:batch_id => @batch.id)
      Donation.create!(:purchase_id => @purchase.id).class.should == Donation
    end

    it "should not allow votes for a closed batch" do
      @batch.close!
      # should not allow new donation tied to this batch.
      @product = Product.create!(:name => "teaching of buddha")
      @purchase = Purchase.create(:product_id => @product.id,:batch_id => @batch.id)
      # @purchase.should == false
      @purchase.state.should == "invalid-batch-cancelled"
      # Donation.create!(:purchase_id => @purchase.id).should == false
      ## the donation does not concern self with the batch being closed...
    end

  end
end
