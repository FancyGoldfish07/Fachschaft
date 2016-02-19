require 'rails_helper'

RSpec.describe "event_typs/new", type: :view do
  before(:each) do
    assign(:event_typ, EventTyp.new(
      :name => "MyString"
    ))
  end

  it "renders new event_typ form" do
    render

    assert_select "form[action=?][method=?]", event_typs_path, "post" do

      assert_select "input#event_typ_name[name=?]", "event_typ[name]"
    end
  end
end
