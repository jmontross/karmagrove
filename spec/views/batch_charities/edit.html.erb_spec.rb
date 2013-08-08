require 'spec_helper'

describe "batch_charities/edit" do
  before(:each) do
    @batch_charity = assign(:batch_charity, stub_model(BatchCharity,
      :batch_id => "",
      :charity_id => ""
    ))
  end

  it "renders the edit batch_charity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => batch_charities_path(@batch_charity), :method => "post" do
      assert_select "input#batch_charity_batch_id", :name => "batch_charity[batch_id]"
      assert_select "input#batch_charity_charity_id", :name => "batch_charity[charity_id]"
    end
  end
end
