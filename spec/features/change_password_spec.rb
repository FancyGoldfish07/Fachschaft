require 'rails_helper'
require 'spec_helper'

RSpec.feature 'As a registered user I want to change my password' do
  context 'at start page (backend)' do
    let(:user) {FactoryGirl.create(:user)}

    before (:each) do
      sign_in user
    end

    scenario 'change password' do
      within ('#myNavbar') do
        click_link ('Passwort ändern')
      end
      fill_in 'user_password', :with => '12345678'
      fill_in 'user_password_confirmation', :with => '12345678'
      fill_in 'user_current_password', :with => '12345678'

      click_button 'Abschicken'
      expect(page).to have_content 'Erfolgreich geändert'
    end
  end
end