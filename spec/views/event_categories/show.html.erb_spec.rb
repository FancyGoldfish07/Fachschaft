require 'rails_helper'

RSpec.describe "event_categories/show", type: :view do
  before(:each) do
    @event_category = assign(:event_category, EventCategory.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
