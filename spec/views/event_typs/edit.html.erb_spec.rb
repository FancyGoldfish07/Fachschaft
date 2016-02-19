require 'rails_helper'

RSpec.describe "event_typs/edit", type: :view do
  before(:each) do
    @event_typ = assign(:event_typ, EventTyp.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit event_typ form" do
    render

    assert_select "form[action=?][method=?]", event_typ_path(@event_typ), "post" do

      assert_select "input#event_typ_name[name=?]", "event_typ[name]"
    end
  end
end
