require 'rails_helper'

RSpec.describe "recurrences/index", type: :view do
  before(:each) do
    assign(:recurrences, [
      Recurrence.create!(
        :event_id => 1,
        :pattern => "MyText"
      ),
      Recurrence.create!(
        :event_id => 1,
        :pattern => "MyText"
      )
    ])
  end

  it "renders a list of recurrences" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
