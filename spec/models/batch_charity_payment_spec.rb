require 'spec_helper'

describe BatchCharityPayment do

  before do
   @batch_complete = Batch.create(:batch_name => "test batch that is done", :sales => 1000, :state => "closed")
   @batch_complete_two = Batch.create(:batch_name => "another test batch that is done", :sales => 613, :state => "closed")
   @batch_incomplete =  Batch.create(:batch_name => "test batch that is done", :sales => 1000)
  end

  it "should find all complete batches when given a new batch_charity_payment object that calls the process method" do
    @batch_charity_payment = BatchCharityPayment.create()
    # not sure if it has status ... @batch_charity_payment.status.should == "something"
    @batch_charity_payment.process.should == "success"
  end


  it "should find all batches with the state 'closed'" do
    #@batch_charity_payment = BatchCharityPayment.create()
    BatchCharityPayment.closed_batches.should =~ [@batch_complete,@batch_complete_two]
    BatchCharityPayment.closed_batches.include?(@batch_incomplete).should == false
  end

  it "should figure out the charities for each of the closed batches and determine the distribution in dollars to each charity for this batch" do

  end

  it "should determine the distribution in dollars to each charity for this batch " do

  end

end
