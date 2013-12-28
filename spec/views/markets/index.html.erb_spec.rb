require 'spec_helper'

describe "markets/index" do
  before(:each) do
    assign(:markets, [
      stub_model(Market,
        :country => "Country",
        :state => "State",
        :county => "County",
        :district => "District",
        :intersection => "Intersection",
        :address => "Address"
      ),
      stub_model(Market,
        :country => "Country",
        :state => "State",
        :county => "County",
        :district => "District",
        :intersection => "Intersection",
        :address => "Address"
      )
    ])
  end

  it "renders a list of markets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Intersection".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
