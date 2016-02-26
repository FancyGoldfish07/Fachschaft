require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Sign up/in', 'As a "user" I want so sign up and check if I can sign in/out' do
  context 'start page' do
    let(:user){FactoryGirl.build(:user, email: 'info@fachschaft.de', username: 'TestUser', encrypted_password: '12345678')}
  end


  scenario 'Signing in with correct credentials' do
      visit '/users/sign_in'
        fill_in 'user_email', :with => 'info@fachschaft.de'
        fill_in 'user_password', :with => '12345678'
      click_button 'commit'
      expect(page).to have_content 'Erfolgreich angemeldet.'
  end
end