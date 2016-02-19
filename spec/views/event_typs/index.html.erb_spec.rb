require 'rails_helper'

RSpec.describe "event_typs/index", type: :view do
  before(:each) do
    assign(:event_typs, [
      EventTyp.create!(
        :name => "Name"
      ),
      EventTyp.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of event_typs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
