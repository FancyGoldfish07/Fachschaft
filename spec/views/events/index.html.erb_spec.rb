require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :priority => 1,
        :flag => false,
        :imageURL => "MyText",
        :url => "MyText",
        :ort => "MyText",
        :description => "MyText"
      ),
      Event.create!(
        :title => "Title",
        :priority => 1,
        :flag => false,
        :imageURL => "MyText",
        :url => "MyText",
        :ort => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
