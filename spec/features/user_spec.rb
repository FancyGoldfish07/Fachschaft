require 'rails_helper'
require 'spec_helper'

RSpec.feature :type => feature do

  context 'start page' do
    let(:user){FactoryGirl.build(:user, email: 'info@fachschaft.de', username: 'TestUser', encrypted_password: '12345678')}
  end

  describe 'Check if the home path is the root_path' do
    it 'should be equal which path you set' do
      visit '/home'
      expect(current_path).to_eql 'root_path'
    end
  end

  describe 'A User can sign up' do
    it 'with correct data' do
      visit 'users/sign_up'
      within '#new_user' do
        fill_in 'user_email', :with => 'test@fachschaft.de'
        fill_in 'user_username', :with => 'AdminUser'
        fill_in 'user_password', :with => '23456789'
        fill_in 'user_password_confirmation', :with => '23456789'
      end
      click_button 'Account erstellen'
      expect(page).to have_content('Logout')
    end
  end

  describe 'Users sign in' do
    it 'with valid email an password' do
      visit '/users/sign_in'
      within '#new_user' do
        fill_in 'user_email', :with => :user.email
        fill_in 'user_password', :with => :user.encrypted_password
        click_button 'Log In'
        end
      expect(page).to have_content('Logout')
    end

    it 'with invalid email and password' do
      visit 'users/sign_in'
      within '#new_user' do
        fill_in 'user_email', :with => :user.email
        fill_in 'user_password', :with => '1234567'
        click_button 'Log In'
      end
     expect(page).to have_content('new_user')
    end
  end
end