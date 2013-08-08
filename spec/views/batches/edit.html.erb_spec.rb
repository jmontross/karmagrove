require 'spec_helper'

describe "batches/edit" do
  before(:each) do
    @batch = assign(:batch, stub_model(Batch,
      :batch_name => "MyString",
      :sales => 1.5
    ))
  end

  it "renders the edit batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => batches_path(@batch), :method => "post" do
      assert_select "input#batch_batch_name", :name => "batch[batch_name]"
      assert_select "input#batch_sales", :name => "batch[sales]"
    end
  end
end
