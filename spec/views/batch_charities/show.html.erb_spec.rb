require 'spec_helper'

describe "batch_charities/show" do
  before(:each) do
    @batch_charity = assign(:batch_charity, stub_model(BatchCharity,
      :batch_id => "",
      :charity_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
