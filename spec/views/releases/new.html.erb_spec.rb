require 'spec_helper'

describe "releases/new.html.erb" do
  before(:each) do
    assign(:release, stub_model(Release,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new release form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => releases_path, :method => "post" do
      assert_select "input#release_name", :name => "release[name]"
    end
  end
end
