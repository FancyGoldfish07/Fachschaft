require 'rails_helper'

RSpec.describe "excludes/edit", type: :view do
  before(:each) do
    @exclude = assign(:exclude, Exclude.create!())
  end

  it "renders the edit exclude form" do
    render

    assert_select "form[action=?][method=?]", exclude_path(@exclude), "post" do
    end
  end
end
