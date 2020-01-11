require 'rails_helper'

RSpec.describe "conferences/index", type: :view do
  before(:each) do
    assign(:conferences, [
      Conference.create!(
        :title => "Title",
        :location => "Location",
        :description => "Description",
        :image_url => "Image Url"
      ),
      Conference.create!(
        :title => "Title",
        :location => "Location",
        :description => "Description",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of conferences" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
