require 'spec_helper'

describe "buddhas/index" do
  before(:each) do
    assign(:buddhas, [
      stub_model(Buddha,
        :product => "",
        :file_location => "File Location",
        :media_type => "Media Type"
      ),
      stub_model(Buddha,
        :product => "",
        :file_location => "File Location",
        :media_type => "Media Type"
      )
    ])
  end

  it "renders a list of buddhas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "File Location".to_s, :count => 2
    assert_select "tr>td", :text => "Media Type".to_s, :count => 2
  end
end
