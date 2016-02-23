require 'rails_helper'

RSpec.describe "event_categories/index", type: :view do
  before(:each) do
    assign(:event_categories, [
      EventCategory.create!(
        :name => "Name"
      ),
      EventCategory.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of event_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
