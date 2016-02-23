require 'rails_helper'

RSpec.describe "event_categories/edit", type: :view do
  before(:each) do
    @event_category = assign(:event_category, EventCategory.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit event_category form" do
    render

    assert_select "form[action=?][method=?]", event_category_path(@event_category), "post" do

      assert_select "input#event_category_name[name=?]", "event_category[name]"
    end
  end
end
