require 'rails_helper'

RSpec.describe "speakers/index", type: :view do
  before(:each) do
    assign(:speakers, [
      Speaker.create!(),
      Speaker.create!()
    ])
  end

  it "renders a list of speakers" do
    render
  end
end
