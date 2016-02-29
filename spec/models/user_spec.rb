require 'rails_helper'
RSpec.describe User, type: :model do

  let(:user) {FactoryGirl.create(:user)}
  let(:fs) {FactoryGirl.create(:fs_user)}



  #Test whether important values are set

  describe 'needs an email' do
    it 'is valid with an email' do
      expect(user).to be_valid
    end
    it 'is invalid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe 'needs a username' do
    it 'is valid with an username' do
      expect(user).to be_valid
    end
    it 'is invalid without an username' do
      user.username = nil
      expect(user).to_not be_valid
    end
  end

  describe 'needs a password at minimum 8 chars' do
    it 'is valid a with password which contains min 8 chars' do
      expect(user).to be_valid
    end
    it 'is invalid without a password' do
      user.password = nil
      expect(user).to_not be be_valid
    end
    it 'is invalid with a shorten password' do
      user.password = '1234567'
      expect(user).to_not be_valid
    end
  end

  describe 'needs an unique email' do
    it 'is invalid without a unique email' do
      fs.email = user.email
      # user and fs_user both have the same email address
      expect(fs).to_not be_valid
    end
    it 'is valid wih several email addresses' do
      # user.email is info@fachschaft.de
      fs.email = 'test@fachschaft.de'
      expect(fs).to be_valid
    end
  end

  describe 'needs an unique username' do
    it 'is invalid without an unique username' do
      fs.username = user.username
      # user and fs both have username 'Test'
      expect(fs).to_not be_valid
    end
    it 'is valid with several usernames' do
      #user.username is 'Test'
      fs.username = 'AnotherName'
      expect(fs).to be_valid
    end
  end

  describe 'needs an username which is not an email address' do
    it 'is valid with a username which is not an email address' do
      expect(user).to be_valid
    end
    it 'is not valid with a username format like an email address' do
      user.username = 'test@test.de'
      expect(user).to_not be_valid
    end
  end
end
