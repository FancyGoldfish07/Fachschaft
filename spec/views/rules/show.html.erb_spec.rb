require 'rails_helper'

RSpec.describe "rules/show", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :mode => 1,
      :day => 2,
      :recurrence => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
