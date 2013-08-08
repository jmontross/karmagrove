require 'spec_helper'

describe "batches/new" do
  before(:each) do
    assign(:batch, stub_model(Batch,
      :batch_name => "MyString",
      :sales => 1.5
    ).as_new_record)
  end

  it "renders new batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => batches_path, :method => "post" do
      assert_select "input#batch_batch_name", :name => "batch[batch_name]"
      assert_select "input#batch_sales", :name => "batch[sales]"
    end
  end
end
