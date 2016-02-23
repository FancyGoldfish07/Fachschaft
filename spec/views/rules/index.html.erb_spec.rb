require 'rails_helper'

RSpec.describe "rules/index", type: :view do
  before(:each) do
    assign(:rules, [
      Rule.create!(
        :mode => 1,
        :day => 2,
        :recurrence => nil
      ),
      Rule.create!(
        :mode => 1,
        :day => 2,
        :recurrence => nil
      )
    ])
  end

  it "renders a list of rules" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
