require 'spec_helper'

describe "markets/new" do
  before(:each) do
    assign(:market, stub_model(Market,
      :country => "MyString",
      :state => "MyString",
      :county => "MyString",
      :district => "MyString",
      :intersection => "MyString",
      :address => "MyString"
    ).as_new_record)
  end

  it "renders new market form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => markets_path, :method => "post" do
      assert_select "input#market_country", :name => "market[country]"
      assert_select "input#market_state", :name => "market[state]"
      assert_select "input#market_county", :name => "market[county]"
      assert_select "input#market_district", :name => "market[district]"
      assert_select "input#market_intersection", :name => "market[intersection]"
      assert_select "input#market_address", :name => "market[address]"
    end
  end
end
