require 'rails_helper'
RSpec.describe User, type: :model do
#   let(:user) {FactoryGirl.build(:user)}
#   let(:fs) {FactoryGirl.build(:fs_user)}
#   before(:each) do
#     logout
#   end
#   fs.fs!

  before :all do
    @user = User.new
  end

  #Test whether important values are not set (nullable)

  it 'is not valid to create an account without an email address' do
    user = User.new encrypted_password: '12345678'

    expect(user).to_not be_valid
  end

  it 'is required to set a password with minimum 8 chars' do
    user = User.new email: 'test@fachschaft.de', encrypted_password: '1234567'

    expect(user).to_not be_valid
  end

  it 'is require that an email is unique' do
    user1 = User.new email: 'test@fachschaft.de', encrypted_password: '12345678'
    user2 = User.new email: 'test@fachschaft.de', encrypted_password: '23456789'

    expect(user2).to_not be_valid
  end

  it 'is required that an username is unique' do
    user1 = User.new email: 'test@fachschaft.de', encrypted_password: '12345678', username: 'RSPEC_Test'
    user2 = User.new email: 'info@fachschaft.de', encrypted_password: '23456789', username: 'RSPEC_Test'

    expect(user2).to_not be_valid
  end

  it 'is required not to set an email as username' do
    user = User.new email: 'test@fachschaft.de', encrypted_password: '12345678', username: 'test@test.de'

    expect(user).to_not be_valid
  end

  end