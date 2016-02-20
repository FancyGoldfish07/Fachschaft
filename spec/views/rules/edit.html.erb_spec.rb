require 'rails_helper'

RSpec.describe "rules/edit", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :mode => 1,
      :day => 1,
      :recurrence => nil
    ))
  end

  it "renders the edit rule form" do
    render

    assert_select "form[action=?][method=?]", rule_path(@rule), "post" do

      assert_select "input#rule_mode[name=?]", "rule[mode]"

      assert_select "input#rule_day[name=?]", "rule[day]"

      assert_select "input#rule_recurrence_id[name=?]", "rule[recurrence_id]"
    end
  end
end
