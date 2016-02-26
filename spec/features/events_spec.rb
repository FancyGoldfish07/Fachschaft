require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Create and show Tours as User' do
  context 'start page' do
    let (:event){FactoryGirl.build(:event)}
  end

  scenario 'Create an event' do
    visit '/events'
    click_link ('New Event')
    within("#new_event") do
      fill_in('event_title', :with => event.title)
      fill_in('datetimepicker1', :with => event.start)
      fill_in('datetimepicker2', :with => event.end)
      fill_in('event_priority', :with => event.priority)
      fill_in('event_ort', :with => event.ort)
      fill_in('event_role_ids', :with => event.role_id)
      fill_in('event_event_category_id', :with => event.category_id)
    end
    find_button('Event erstellen').click
    expect(page).to have_content('Event was successfully created')
  end
end