require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Subscribe and unsubscribe to the Fachschaft Newsletter' do

  let(:user){ FactoryGirl.create(:user) }



  context 'at start page' do

  scenario 'go to newsletter standard subscribe/unsubscribe page' do
      visit root_path

      # find(:xpath, "//a[@href='/newsletter/abonnement']").click
        click_link 'Abonnement'
    end

  scenario 'subscribe' do
      find('input#subscriber_email').first.fill_in :with => user.email
      find('input#subscriber_name').first.fill_in :with => user.username
      # first(fill_in 'subscriber_email', :with => user.email)
      # first(fill_in 'subscriber_name', :with =>  user.username)

      click_on 'Anmelden'
    expect(page).to have_content('Danke für die Anmeldung')
  end

    scenario 'unsubscribe' do
      visit '/subscribers/new'

      within '#new_subscriber' do
        find('subscriber_email').last.fill_in :with => user.email
      end
      # last(fill_in 'subscriber_email', :with => user.email)

      click_on 'Abmelden'
      expect(page).to have_content('Sie wurden vom Newsletter abgemeldet.')
    end
  end
end

