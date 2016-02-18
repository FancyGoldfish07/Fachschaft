require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :priority => 1,
      :flag => false,
      :imageURL => "MyString",
      :externalLink => "MyString",
      :revision => "MyString",
      :typeOfDate => "MyString",
      :userGroup => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_priority[name=?]", "event[priority]"

      assert_select "input#event_flag[name=?]", "event[flag]"

      assert_select "input#event_imageURL[name=?]", "event[imageURL]"

      assert_select "input#event_externalLink[name=?]", "event[externalLink]"

      assert_select "input#event_revision[name=?]", "event[revision]"

      assert_select "input#event_typeOfDate[name=?]", "event[typeOfDate]"

      assert_select "input#event_userGroup[name=?]", "event[userGroup]"
    end
  end
end
