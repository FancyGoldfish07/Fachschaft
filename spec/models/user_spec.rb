require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.build(:user)}
  let(:fs) {FactoryGirl.build(:fs_user)}
  before(:each) do
    logout
    fs.fs!
  end


  end