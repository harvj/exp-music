require 'spec_helper'

describe "recordings/show.html.erb" do
  before(:each) do
    @recording = assign(:recording, stub_model(Recording,
      :name => "Name",
      :length => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
