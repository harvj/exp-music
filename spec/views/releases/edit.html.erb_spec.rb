require 'spec_helper'

describe "releases/edit.html.erb" do
  before(:each) do
    @release = assign(:release, stub_model(Release,
      :name => "MyString"
    ))
  end

  it "renders the edit release form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => releases_path(@release), :method => "post" do
      assert_select "input#release_name", :name => "release[name]"
    end
  end
end
