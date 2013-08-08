require 'spec_helper'

describe "batch_charities/new" do
  before(:each) do
    assign(:batch_charity, stub_model(BatchCharity,
      :batch_id => "",
      :charity_id => ""
    ).as_new_record)
  end

  it "renders new batch_charity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => batch_charities_path, :method => "post" do
      assert_select "input#batch_charity_batch_id", :name => "batch_charity[batch_id]"
      assert_select "input#batch_charity_charity_id", :name => "batch_charity[charity_id]"
    end
  end
end
