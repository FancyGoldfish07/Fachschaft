require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Subscribe and unsubscribe to the Fachschaft Newsletter' do

  let(:user){ FactoryGirl.create(:user) }

  visit root_path

  context 'at start page' do

  scenario 'go to newsletter standard subscribe/unsubscribe page' do
    within('myNavbar') do
      # find(:xpath, "//a[@href='/newsletter/abonnement']").click
      click.link 'Abonnement'
    end
    expect(current_path) == '/newsletter/abonnement'
  end

  scenario 'subscribe' do
    within ('#new_subscriber') do
      fill_in 'subscriber_email', :with => user.email
      fill_in 'subscriber_name', with =>  user.username

      click_on 'Anmelden'
    end
    expect(page).to have_content('Danke für die Anmeldung')
  end

    scenario 'unsubscribe' do
      visit '/subscribers/new'
      fill_in 'subscriber_email', :with => user.email

      click_on 'Abmelden'
      expect(page).to have_content('Sie wurden vom Newsletter abgemeldet.')
    end
  end
end

