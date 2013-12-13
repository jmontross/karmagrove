require 'spec_helper'

describe EmailSubscriber do

  before do
     @user, @status = EmailSubscriber.subscribe("boooyaaaaahkkkaaaashah@karmagrove.com")
  end
  it " should make a user that is an EmailSubscriber on EmailSubscriber.subscribe" do
    @user.class == EmailSubscriber
    @status.should === "success"
  end

  it "should mark an EmailSubscriber as true for the email-subsciber column" do
     @user.email_subscriber.should == true
  end
end
