require 'rails_helper'

RSpec.describe "Excludes", type: :request do
  describe "GET /excludes" do
    it "works! (now write some real specs)" do
      get excludes_path
      expect(response).to have_http_status(200)
    end
  end
end
