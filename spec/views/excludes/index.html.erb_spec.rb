require 'rails_helper'

RSpec.describe "excludes/index", type: :view do
  before(:each) do
    assign(:excludes, [
      Exclude.create!(),
      Exclude.create!()
    ])
  end

  it "renders a list of excludes" do
    render
  end
end
