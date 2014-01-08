require 'spec_helper'

describe CharityPayment do

  before :each do
    @charity_yaml = YAML.load_file('spec/fixtures/charity.yml')
    @charity = Charity.create! @charity_yaml["charity_01"]
    @charity_payment = CharityPayment.create!(:amount=> 500, :charity_id => @charity.id)
  end


  it "should pay a charity" do
    @charity_payment.pay.should == "success"
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
