require 'spec_helper'

describe "batch_charities/index" do
  before(:each) do
    assign(:batch_charities, [
      stub_model(BatchCharity,
        :batch_id => "",
        :charity_id => ""
      ),
      stub_model(BatchCharity,
        :batch_id => "",
        :charity_id => ""
      )
    ])
  end

  it "renders a list of batch_charities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
