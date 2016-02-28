require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Sign up' do
  context 'at start page' do
    scenario 'sign up' do
        visit root_path

        find(:xpath, "//a[@href='/users/sign_up']").click
        # alternative way to sign up
        # click_link 'Registrieren'

        within '#new_user' do
          fill_in 'user_email', with: 'abc@fachschaft.de'
          fill_in 'user_username', with: 'MusterFachschaftler'
          fill_in 'user_password', with: '12345678'
          fill_in 'user_password_confirmation', with: '12345678'
        end

      expect { click_button 'Account erstellen'}.to change{User.count}.by(1)
      expect(page).to have_content 'Du hast dich erfolgreich registriert.'
    end
  end
end