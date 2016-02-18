require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :priority => 1,
      :flag => false,
      :imageURL => "MyText",
      :url => "MyText",
      :repeat => 1,
      :typeOfDate => 1,
      :userGroup => 1
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_priority[name=?]", "event[priority]"

      assert_select "input#event_flag[name=?]", "event[flag]"

      assert_select "textarea#event_imageURL[name=?]", "event[imageURL]"

      assert_select "textarea#event_url[name=?]", "event[url]"

      assert_select "input#event_repeat[name=?]", "event[repeat]"

      assert_select "input#event_typeOfDate[name=?]", "event[typeOfDate]"

      assert_select "input#event_userGroup[name=?]", "event[userGroup]"
    end
  end
end
