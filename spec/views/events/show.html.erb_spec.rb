require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :priority => 1,
      :flag => false,
      :imageURL => "Image Url",
      :externalLink => "External Link",
      :revision => "Revision",
      :typeOfDate => "Type Of Date",
      :userGroup => "User Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/External Link/)
    expect(rendered).to match(/Revision/)
    expect(rendered).to match(/Type Of Date/)
    expect(rendered).to match(/User Group/)
  end
end
