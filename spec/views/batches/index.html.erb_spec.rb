require 'spec_helper'

describe "batches/index" do
  before(:each) do
    assign(:batches, [
      stub_model(Batch,
        :batch_name => "Batch Name",
        :sales => 1.5
      ),
      stub_model(Batch,
        :batch_name => "Batch Name",
        :sales => 1.5
      )
    ])
  end

  it "renders a list of batches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Batch Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
