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
      fill_in 'user_password', :with => 'Sparten123'
      fill_in 'user_password_confirmation', :with => 'Sparten123'
      fill_in 'user_current_password', :with => '12345678'

      click_button 'Update'
      expect(page).to have_content 'Deine Daten wurden aktualisiert.'
    end
  end
end