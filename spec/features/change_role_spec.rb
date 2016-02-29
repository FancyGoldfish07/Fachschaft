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
      expect(admin.has_role? "Admin")
    end
  end
end