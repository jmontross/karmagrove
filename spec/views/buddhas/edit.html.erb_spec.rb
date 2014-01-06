require 'spec_helper'

describe "buddhas/edit" do
  before(:each) do
    @buddha = assign(:buddha, stub_model(Buddha,
      :product => "",
      :file_location => "MyString",
      :media_type => "MyString"
    ))
  end

  it "renders the edit buddha form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buddhas_path(@buddha), :method => "post" do
      assert_select "input#buddha_product", :name => "buddha[product]"
      assert_select "input#buddha_file_location", :name => "buddha[file_location]"
      assert_select "input#buddha_media_type", :name => "buddha[media_type]"
    end
  end
end
