require 'spec_helper'

describe EmailSubscriber do
  it " should make a user that is an EmailSubscriber on EmailSubscriber.subscribe" do
    EmailSubscriber.subscribe("boooyaaaaahkkkaaaashah@karmagrove.com").should === "success"
  end
end
