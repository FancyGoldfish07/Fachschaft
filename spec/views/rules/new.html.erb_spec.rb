require 'rails_helper'

RSpec.describe "rules/new", type: :view do
  before(:each) do
    assign(:rule, Rule.new(
      :mode => 1,
      :day => 1,
      :recurrence => nil
    ))
  end

  it "renders new rule form" do
    render

    assert_select "form[action=?][method=?]", rules_path, "post" do

      assert_select "input#rule_mode[name=?]", "rule[mode]"

      assert_select "input#rule_day[name=?]", "rule[day]"

      assert_select "input#rule_recurrence_id[name=?]", "rule[recurrence_id]"
    end
  end
end
