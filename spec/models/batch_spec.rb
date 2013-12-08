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

    it "should not allow state other than open or closed" do
      @batch.state = "dead"
      @batch.current_state.to_s.should == "open"
    end

  end
end
