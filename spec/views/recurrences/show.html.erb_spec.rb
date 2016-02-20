require 'rails_helper'

RSpec.describe "recurrences/show", type: :view do
  before(:each) do
    @recurrence = assign(:recurrence, Recurrence.create!(
      :event_id => 1,
      :pattern => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
