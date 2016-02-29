require 'rails_helper'

RSpec.describe Event, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

    let (:event) {FactoryGirl.create(:event)}
    let(:user) {FactoryGirl.create(:user)}


  # Test if all required parameters are set
  describe 'needs a title' do
    it 'is valid with a title' do
      expect(event).to be_valid
    end

    it 'is invalid without a title' do
      event.title = nil
      expect(event).not_to be_valid
    end
  end

  describe 'needs a start' do
    it 'is valid with date and time' do
      expect(event).to be_valid
    end
    it 'is invalid without date and time' do
      event.start = nil
      expect(event).not_to be_valid
    end
  end

  describe 'needs a priority' do
  it 'is valid with a priority according to enum' do
    expect(event).to be_valid
  end
  end

  describe 'needs a flag' do
    it 'is valid with a flag (true or false)' do
      expect(event).to be_valid
    end
  end

  describe 'needs an end' do
    it 'is valid with an end' do
      expect(event).to be_valid
    end
    it 'is not valid without an end' do
      event.end = nil
      expect(event).not_to be_valid
    end
  end

  describe 'needs a location' do
    it 'is valid with a location ' do
      expect(event).to be_valid
    end
  end

  describe 'needs an event category id' do
    it 'is valid with an event_category_id' do
      expect(event).to be_valid
    end
  end
end