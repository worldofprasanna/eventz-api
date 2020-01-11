require 'rails_helper'

RSpec.describe "conferences/show", type: :view do
  before(:each) do
    @conference = assign(:conference, Conference.create!(
      :title => "Title",
      :location => "Location",
      :description => "Description",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Image Url/)
  end
end
