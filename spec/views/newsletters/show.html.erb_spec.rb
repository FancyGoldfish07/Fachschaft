require 'rails_helper'

RSpec.describe "newsletters/show", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :subject => "Subject",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
  end
end
