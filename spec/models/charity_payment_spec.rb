require 'spec_helper'

describe CharityPayment do

  before :each do
    @charity_yaml = YAML.load_file('spec/fixtures/charity.yml')
    @charity = Charity.create! @charity_yaml["charity_01"]
    @charity_payment = CharityPayment.create!(:amount=> 500, :charity_id => @charity.id)
  end


  it "should pay a charity" do
    @charity_payment.pay.should == "success"

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

  it "should keep a reference to the payment provider" do
    @charity_payment.pay
    @charity_payment.payment_provider.should == "balanced"
  end

  it "should not pay a charity without a bank account" do
    @charity = Charity.create! @charity_yaml["charity_02"]
    @charity_payment = CharityPayment.create!(:amount=> 500, :charity_id => @charity.id)
    @charity_payment.pay.should == "failure"
  end

end
