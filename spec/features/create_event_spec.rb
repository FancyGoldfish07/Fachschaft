require 'rails_helper'
require 'spec_helper'

RSpec.feature 'As a "Faschaftler", "Manager" or "Admin" I can create an event ' do
  context 'at start page' do
    let(:admin) { FacoryGirl.create(:admin)}
    let(:manager) {FactoryGirl.create(:manager)}
    let(:fs) {FactoryGirl.create(:fs_user)}

    scenario 'create an event as admin' do
      sign_in admin

      click_link 'Neues Event'
      expect(page).to have_link('Neuen Eintrag erstellen')
    end

    scenario 'create an event as manager' do
      sign_in manager

      click_link 'Neues Event'
      expect(page).to have_link('Neuen Eintrag erstellen')
    end

    scenario 'create an event as Fachschaftler' do
      sign_in fs_user

      click_link 'Neues Event'
      expect(page).to have_link('Neuen Eintrag erstellen')
    end
  end
end