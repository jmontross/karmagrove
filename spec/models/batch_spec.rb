require 'spec_helper'

describe Batch do

  #14
  describe "batch state" do
    before :each do
      @batch = Batch.create()
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
     @charity = Charity.create(:legal_name =>"grind out hunger")
     @batch_charity = BatchCharity.create(:charity_id=>@charity.id,:batch_id => @batch.id)
     # @fake_BatchCharity.create(:charity_id=>@charity.id,:batch_id => @batch.id)
     @batch.batch_charities = [@batch_charity]
     @batch.save
     @batch.map_of_charity_ids.should == { @batch_charity.id => 0 }
    end

    it "should count all the donations of a batch and increment the map of charity ids with a weight of 1 vote per donation" do
     @charity = Charity.create(:legal_name =>"grind out hunger") 
     @charity2 = Charity.create(:legal_name =>"grey bears")
     @charity3 = Charity.create(:legal_name =>"second harvest") 
     
     @batch_charity = BatchCharity.create(:charity_id=>@charity.id,:batch_id => @batch.id)          
     @batch_charity2 = BatchCharity.create(:charity_id=>@charity2.id,:batch_id => @batch.id)          
     @batch_charity3 = BatchCharity.create(:charity_id=>@charity3.id,:batch_id => @batch.id)               
     @batch.batch_charities = [@batch_charity,@batch_charity2,@batch_charity3]
     @batch.save
     # @batch.calculate_charities_owed.should.sort.eql? {@charity
     @batch.calculate_charities_owed.should == {}        
    end


  end
end
