require 'spec_helper'

describe "recordings/new.html.erb" do
  before(:each) do
    assign(:recording, stub_model(Recording,
      :name => "MyString",
      :length => 1
    ).as_new_record)
  end

  it "renders new recording form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recordings_path, :method => "post" do
      assert_select "input#recording_name", :name => "recording[name]"
      assert_select "input#recording_length", :name => "recording[length]"
    end
  end
end
