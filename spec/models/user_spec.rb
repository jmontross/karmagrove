require 'spec_helper'

describe User do
  before do
    User.delete_all
  end

  it "should allow a created user to begin as an email subsciber" do
    u = User.create! :email => "foo@f.com", :password => "oasdafasdfa ", :email_subscriber => true
    u.email_subscriber.should == true
  end
end
