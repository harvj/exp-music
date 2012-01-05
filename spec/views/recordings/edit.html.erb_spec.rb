require 'spec_helper'

describe "recordings/edit.html.erb" do
  before(:each) do
    @recording = assign(:recording, stub_model(Recording,
      :name => "MyString",
      :length => 1
    ))
  end

  it "renders the edit recording form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recordings_path(@recording), :method => "post" do
      assert_select "input#recording_name", :name => "recording[name]"
      assert_select "input#recording_length", :name => "recording[length]"
    end
  end
end
