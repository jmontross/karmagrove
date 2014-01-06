require 'spec_helper'

describe "buddhas/new" do
  before(:each) do
    assign(:buddha, stub_model(Buddha,
      :product => "",
      :file_location => "MyString",
      :media_type => "MyString"
    ).as_new_record)
  end

  it "renders new buddha form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buddhas_path, :method => "post" do
      assert_select "input#buddha_product", :name => "buddha[product]"
      assert_select "input#buddha_file_location", :name => "buddha[file_location]"
      assert_select "input#buddha_media_type", :name => "buddha[media_type]"
    end
  end
end
