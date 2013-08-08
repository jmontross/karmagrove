require 'spec_helper'

describe "batches/show" do
  before(:each) do
    @batch = assign(:batch, stub_model(Batch,
      :batch_name => "Batch Name",
      :sales => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Batch Name/)
    rendered.should match(/1.5/)
  end
end
