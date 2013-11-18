require 'spec_helper'

describe Charity do
  describe "total_donations" do
    before :each do
      @charity = Charity.create(:legal_name => "Cool Charity")
    end
    
    it "should give us 0 if no donations found" do
      @charity.total_donations.should == 0
    end
    
    it "should tell us the total donations for a single charity" do
      @charity.donations << Donation.create(:amount => 1000.0)
      @charity.donations << Donation.create(:amount => 200.0)
      Donation.create(:amount => 100.0)
      @charity.total_donations.should == 1200.0
    end
  end
end
