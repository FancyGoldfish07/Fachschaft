require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :priority => 1,
      :flag => false,
      :imageURL => "MyText",
      :url => "MyText",
      :ort => "MyText",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end

  # Filter the fullcalendar by month, week or day
  it 'displays the calendar at view month' do
    visit '/fullcalendar'
    within 'div.fc-button-group' do
      click_button 'month'
    end
    expect(rendered).to have_css 'div.fc-view fc-month-view fc-basic-view'
  end

  it 'displays the calendar at view mweek' do
    visit '/fullcalendar'
    within 'div.fc-button-group' do
      click_button 'week'
    end
    expect(rendered).to have_css 'div.fc-view fc-agendaWeek-view fc-agenda-view'
  end

  it 'displays the calendar at view day' do
    visit '/fullcalendar'
    within 'div.fc-button-group' do
      click_button 'day'
    end
    expect(rendered).to have_css 'div.fc-view fc-agendaDay-view fc-agenda-view'
  end

  end
