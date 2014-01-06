require 'spec_helper'

describe "buddhas/show" do
  before(:each) do
    @buddha = assign(:buddha, stub_model(Buddha,
      :product => "",
      :file_location => "File Location",
      :media_type => "Media Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/File Location/)
    rendered.should match(/Media Type/)
  end
end
