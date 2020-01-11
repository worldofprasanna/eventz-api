require 'rails_helper'

RSpec.describe "conferences/edit", type: :view do
  before(:each) do
    @conference = assign(:conference, Conference.create!(
      :title => "MyString",
      :location => "MyString",
      :description => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders the edit conference form" do
    render

    assert_select "form[action=?][method=?]", conference_path(@conference), "post" do

      assert_select "input[name=?]", "conference[title]"

      assert_select "input[name=?]", "conference[location]"

      assert_select "input[name=?]", "conference[description]"

      assert_select "input[name=?]", "conference[image_url]"
    end
  end
end
