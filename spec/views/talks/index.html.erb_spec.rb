require 'rails_helper'

RSpec.describe "talks/index", type: :view do
  before(:each) do
    assign(:talks, [
      Talk.create!(
        :title => "Title",
        :description => "Description",
        :speaker => nil,
        :type => "Type"
      ),
      Talk.create!(
        :title => "Title",
        :description => "Description",
        :speaker => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of talks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
