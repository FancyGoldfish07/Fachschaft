require 'rails_helper'
require 'spec_helper'

RSpec.feature 'As a registered user I want to to sign in' do
  context 'at start page' do

    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
    end

    scenario 'sign in' do
      expect(page).to have_content 'Erfolgreich angemeldet.'
    end

    scenario 'sign out' do
      sign_out user

      expect(page).to_not have_link 'Account löschen'
      expect(page).to_not have_link 'Logout'
    end

  end
end
