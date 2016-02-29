require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Subscribe and unsubscribe to the Fachschaft Newsletter' do

  let(:user){ FactoryGirl.create(:user) }

  context 'at start page' do

  scenario 'go to newsletter standard subscribe/unsubscribe page' do
    within('myNavbar') do
      find(:xpath, "//a[@href='/newsletter/abonnement']").click
    end
    expect(current_path).to eql '/newsletter/abonnement'
  end

  scenario 'subscribe' do
    within ('#new_subscriber') do
      fill_in 'subscriber_email', :with => user.email
      fill_in 'subscriber_name', with =>  user.username

      click_button 'Anmelden'
    end
    expect(page).to have_content('Danke für die Anmeldung')
  end

    scenario 'unsubscribe' do
      visit '/subscribers/new'
      fill_in 'subscriber_email', :with => user.email

      click_button 'Abmelden'
      expect(page).to have_content('Sie wurden vom Newsletter abgemeldet.')
    end
  end
end

