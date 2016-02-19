require 'rails_helper'

RSpec.describe "event_typs/show", type: :view do
  before(:each) do
    @event_typ = assign(:event_typ, EventTyp.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
