require 'spec_helper'

describe Batch do

  #14
  describe "batch state" do
    before :each do

      Batch.delete_all
      BatchCharity.delete_all
      Charity.delete_all
      @batch = Batch.create
    end

    it "should begin with three new charities" do
      @charities = Charity.all(:limit => 3).map {|chair| chair.id}
      @batch.batch_charities.map {|batch_chair| batch_chair.charity_id}
      # @batch.charity_ids.should == @charities
    end


    it "should begin with a state of open" do
      @batch.current_state.to_s.should == 'open'
    end

    it "should be able to be closed" do
      @batch.close!
      @batch.current_state.to_s.should == 'closed'
      @batch.state.should == 'closed'
    end

    it "should be able to be cancelled and resumed" do
      @batch.cancel!
      @batch.current_state.to_s.should == 'cancelled'
      # @batch.state.should == 'closed'
      @batch.resume!
      @batch.current_state.to_s.should == 'open'
    end

    it "should not allow state other than open or closed" do
      @batch.state = "dead"
      @batch.current_state.to_s.should == "open"
    end

    it "should create a map_of_charity_ids" do
     @charity = Charity.create!(:legal_name =>"grind out hunger")
     @batch_charity = BatchCharity.create!(:charity_id=>@charity.id,:batch_id => @batch.id)
     @batch.batch_charities = [@batch_charity]
     @batch.save!
     @batch.map_of_charity_ids.should == { @charity.id => 0 }

    end

    it "should count all the donations of a batch" do
     @charity = Charity.create(:legal_name =>"grind out hunger")
     @charity2 = Charity.create(:legal_name =>"grey bears")
     @charity3 = Charity.create(:legal_name =>"second harvest")

     @batch_charity = BatchCharity.create(:charity_id=>@charity.id,:batch_id => @batch.id)
     @batch_charity2 = BatchCharity.create(:charity_id=>@charity2.id,:batch_id => @batch.id)
     @batch_charity3 = BatchCharity.create(:charity_id=>@charity3.id,:batch_id => @batch.id)
     @batch.batch_charities = [@batch_charity,@batch_charity2,@batch_charity3]
     @batch.save
     # @batch.calculate_charities_owed.should.sort.eql? {@charity
     @product = Product.create(:name => "teaching of buddha text")
     @purchase = Purchase.create!(:batch_id => @batch.id, :product_id => @product.id)
     Donation.create(:charity_id => @charity.id, :purchase_id => @purchase.id)
     @batch.purchases.first.should == @purchase
     #@batch.donations.count.should == 1
    end

    it "should increment the map of charity ids with a weight of 1 vote per donation" do
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

     @donation = Donation.create!(:charity_id => @charity.id, :purchase_id => @purchase.id)
     @purchase.donation_id = @donation.id
     @purchase.save!
      # = Purchase.create!(:batch_id => @fancy_batch.id, :product_id=>@product.id)

     # this is sort of confusing.  Need to clean up this logic of voting for profits of a batch.
     @fancy_batch.calculate_charities_owed.should == {@charity.id => 1}
    end


  end
end
