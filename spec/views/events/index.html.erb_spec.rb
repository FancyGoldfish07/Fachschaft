require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :priority => 1,
        :flag => false,
        :imageURL => "Image Url",
        :externalLink => "External Link",
        :revision => "Revision",
        :typeOfDate => "Type Of Date",
        :userGroup => "User Group"
      ),
      Event.create!(
        :title => "Title",
        :priority => 1,
        :flag => false,
        :imageURL => "Image Url",
        :externalLink => "External Link",
        :revision => "Revision",
        :typeOfDate => "Type Of Date",
        :userGroup => "User Group"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "External Link".to_s, :count => 2
    assert_select "tr>td", :text => "Revision".to_s, :count => 2
    assert_select "tr>td", :text => "Type Of Date".to_s, :count => 2
    assert_select "tr>td", :text => "User Group".to_s, :count => 2
  end
end
