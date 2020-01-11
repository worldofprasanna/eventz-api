require 'rails_helper'

RSpec.describe "talks/edit", type: :view do
  before(:each) do
    @talk = assign(:talk, Talk.create!(
      :title => "MyString",
      :description => "MyString",
      :speaker => nil,
      :type => ""
    ))
  end

  it "renders the edit talk form" do
    render

    assert_select "form[action=?][method=?]", talk_path(@talk), "post" do

      assert_select "input[name=?]", "talk[title]"

      assert_select "input[name=?]", "talk[description]"

      assert_select "input[name=?]", "talk[speaker_id]"

      assert_select "input[name=?]", "talk[type]"
    end
  end
end
