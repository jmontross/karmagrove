require 'spec_helper'

describe "markets/show" do
  before(:each) do
    @market = assign(:market, stub_model(Market,
      :country => "Country",
      :state => "State",
      :county => "County",
      :district => "District",
      :intersection => "Intersection",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country/)
    rendered.should match(/State/)
    rendered.should match(/County/)
    rendered.should match(/District/)
    rendered.should match(/Intersection/)
    rendered.should match(/Address/)
  end
end
