require 'rails_helper'
describe UserPolicy do
  subject{ UserPolicy}
  context "for an admin" do
    let(:current_user) { create(:user,:admin)}
    let(:model) {create(:fs_user,:fs)}
    permissions :update? do
      it "should allow an admin to update a user" do
        expect(subject).to permit(current_user,model)
      end
      it "should not allow a Fs user to update an admin" do
        expect(subject).to_not permit(model,current_user)
      end
    end
  end
end