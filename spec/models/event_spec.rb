require 'rails_helper'

RSpec.describe Event, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

  before :all do
    @nullEvent = Event.new
    @event = Event.new title: 'Test', priority: 'high', flag: 'true', imageURL: 'https://www.test.com', url: 'http://www.anotherTest.com', ort: 'Ghosttown', description: 'Just a short test', event_category_id: '1'
  end


  # Test if a value not set (nullable)
  it 'is required to set a title' do
    expect(@nullEvent.title).not_to be_nil
  end

  it 'is required to set start' do
    expect(@nullEvent.start).not_to be_nil
  end

  it 'is required to set priority' do
    expect(@nullEvent.priority).not_to be_nil
  end

  it 'is required to set end' do
    expect(@nullEvent.end).not_to be_nil
  end

  it 'is required to set ort' do
    expect(@nullEvent.ort).not_to be_nil
  end

  it 'is required to set event_category_id' do
    expect(@nullEvent.event_category_id).not_to be_nil
  end

  it 'is required to set recurrence_id' do
    expect(@nullEvent.recurrence_id).not_to be_nil
  end

  it 'is required to set repeats' do
    expect(@nullEvent.repeats).not_to be_nil
  end

  it 'is required to set reviewed' do
    expect(@nullEvent.reviewed).not_to be_nil
  end



  # This Test only checks whether the get-methods are working well

  it 'return the correct tile' do
    expect(@event.title) == 'Test'
  end

  it 'returns the correct priority' do
    expect(@event.priority) == 'high'
  end

  it 'returns the correkt boolean for flag' do
    expect (@event.flag) == 'true'
  end

  it 'return the correct ImageURL' do
    expect(@event.imageURL) == 'https://wwww.test.com'
  end

  it 'return the correct url' do
    expect(@event.url) == 'http://wwww.anothertest.com'
  end

  it 'return the correct Ort' do
    expect(@event.ort) == 'Ghosttown'
  end

  it 'return the correct description' do
    expect(@event.description) == 'Just a short test'
  end

  it 'return the correct description' do
    expect(@event.event_category_id) == '1'
  end

  # Tests if a value not set (nullable)
  it 'is valid Event with a title' do
    expect(@event).to be_valid
  end
end
