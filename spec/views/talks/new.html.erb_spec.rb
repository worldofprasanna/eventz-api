require 'rails_helper'

RSpec.describe "talks/new", type: :view do
  before(:each) do
    assign(:talk, Talk.new(
      :title => "MyString",
      :description => "MyString",
      :speaker => nil,
      :type => ""
    ))
  end

  it "renders new talk form" do
    render

    assert_select "form[action=?][method=?]", talks_path, "post" do

      assert_select "input[name=?]", "talk[title]"

      assert_select "input[name=?]", "talk[description]"

      assert_select "input[name=?]", "talk[speaker_id]"

      assert_select "input[name=?]", "talk[type]"
    end
  end
end
