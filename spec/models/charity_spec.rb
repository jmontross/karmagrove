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

  it "should allow the storage of a charity's information on balanced so they may be paid " do

    # customer = marketplace.create_customer(
    #         :name           => "Bill",
    #         :email          => "bill@bill.com",
    #         :business_name  => "Bill Inc.",
    #         :ssn_last4      => "1234",
    #         :address => {
    #           :line1 => "1234 1st Street",
    #           :city  => "San Francisco",
    #           :state => "CA"
    #         }
    # ).save

    # puts "our customer uri is #{customer.uri}"

    # puts "create a card and a bank account for our customer"

    # bank_account = marketplace.create_bank_account(
    #         :account_number => "1234567980",
    #         :bank_code => "321174811",
    #         :name => "Jack Q Merchant"
    # )
  end
end
