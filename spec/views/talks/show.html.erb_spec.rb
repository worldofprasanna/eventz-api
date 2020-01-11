require 'rails_helper'

RSpec.describe "talks/show", type: :view do
  before(:each) do
    @talk = assign(:talk, Talk.create!(
      :title => "Title",
      :description => "Description",
      :speaker => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
