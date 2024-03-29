require 'spec_helper'

describe "releases/index.html.erb" do
  before(:each) do
    assign(:releases, [
      stub_model(Release,
        :name => "Name"
      ),
      stub_model(Release,
        :name => "Name"
      )
    ])
  end

  it "renders a list of releases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
