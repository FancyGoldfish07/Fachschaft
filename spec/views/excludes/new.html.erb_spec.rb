require 'rails_helper'

RSpec.describe "excludes/new", type: :view do
  before(:each) do
    assign(:exclude, Exclude.new())
  end

  it "renders new exclude form" do
    render

    assert_select "form[action=?][method=?]", excludes_path, "post" do
    end
  end
end
