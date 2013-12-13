require 'spec_helper'

describe User do
  it "should allow a created user to begin as an email subsciber" do
    u = User.create! :email => "foo@f.com", :password => "oasdafasdfa "
    u.email_subscriber.should == false
  end
end
