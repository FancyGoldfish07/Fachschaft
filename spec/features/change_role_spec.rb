require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Change role' do
  context 'at start page' do

    let(:admin){FactoryGirl.create(:admin)}
    let(:user){FactoryGirl.create(:user)}

    before(:each) do
      sign_in admin
    end

    scenario 'am I an admin?' do
      expect(page).to have_link 'Nutzerverwaltung'
    end

    scenario 'check whether second user is displayed" ' do
      click_link 'Nutzerverwaltung'
      expect(page).to have_css("header h5", text: "manager")
    end

    scenario 'change role of manager from user to manager' do
      find(edit_user_2).find(user_role_ids).choose 'Manager'
      click_button 'Rolle wechseln'
      expect(page).to have_content 'Rolle geändert'
    end

    scenario 'delete "user" account' do
      find(:xpath, "//a[@href='/users/2']").click_link('Löschen')
      accept_alert do
        click_link ('OK')
      end
      expect(page).to have_content 'Nutzer gelöscht'
    end
  end
end