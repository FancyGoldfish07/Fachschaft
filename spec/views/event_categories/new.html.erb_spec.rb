require 'rails_helper'

RSpec.describe "event_categories/new", type: :view do
  before(:each) do
    assign(:event_category, EventCategory.new(
      :name => "MyString"
    ))
  end

  it "renders new event_category form" do
    render

    assert_select "form[action=?][method=?]", event_categories_path, "post" do

      assert_select "input#event_category_name[name=?]", "event_category[name]"
    end
  end
end
