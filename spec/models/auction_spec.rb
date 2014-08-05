require 'spec_helper'

describe Auction do
  describe " auction creation " do
      before :each do
      @auction = Auction.create
      @charity = Charity.create(:legal_name => "Cool Charity")
      
    end

    it "should allow a buy_now price for the seller to change" do


    end

    it "should close the auction if a buyer chooses buy_now" do 

    end

    it "should allow the seller to choose a one to a 3 charities for the buyer to choose from" do

    end

    it "should not allow a user to bid on their own auction" do
    
    end

    it "should allow a user to bid on the auction" do

    end

    it "should know the winning bid user" do

    end

    it "should notify the seller and buyer at the end of the auction" do


    end

    it "should let the buyer choose a charity after they win the auction" do 

    end

    it "should "



end
