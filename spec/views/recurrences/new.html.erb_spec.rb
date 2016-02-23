require 'rails_helper'

RSpec.describe "recurrences/new", type: :view do
  before(:each) do
    assign(:recurrence, Recurrence.new(
      :event_id => 1,
      :pattern => "MyText"
    ))
  end

  it "renders new recurrence form" do
    render

    assert_select "form[action=?][method=?]", recurrences_path, "post" do

      assert_select "input#recurrence_event_id[name=?]", "recurrence[event_id]"

      assert_select "textarea#recurrence_pattern[name=?]", "recurrence[pattern]"
    end
  end
end
