require 'spec_helper'

describe "releases/show.html.erb" do
  before(:each) do
    @release = assign(:release, stub_model(Release,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
