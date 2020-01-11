require 'rails_helper'

RSpec.describe "conferences/new", type: :view do
  before(:each) do
    assign(:conference, Conference.new(
      :title => "MyString",
      :location => "MyString",
      :description => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders new conference form" do
    render

    assert_select "form[action=?][method=?]", conferences_path, "post" do

      assert_select "input[name=?]", "conference[title]"

      assert_select "input[name=?]", "conference[location]"

      assert_select "input[name=?]", "conference[description]"

      assert_select "input[name=?]", "conference[image_url]"
    end
  end
end
