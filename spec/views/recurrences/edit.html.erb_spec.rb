require 'rails_helper'

RSpec.describe "recurrences/edit", type: :view do
  before(:each) do
    @recurrence = assign(:recurrence, Recurrence.create!(
      :event_id => 1,
      :pattern => "MyText"
    ))
  end

  it "renders the edit recurrence form" do
    render

    assert_select "form[action=?][method=?]", recurrence_path(@recurrence), "post" do

      assert_select "input#recurrence_event_id[name=?]", "recurrence[event_id]"

      assert_select "textarea#recurrence_pattern[name=?]", "recurrence[pattern]"
    end
  end
end
