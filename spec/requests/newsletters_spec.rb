require 'rails_helper'

RSpec.describe "Newsletters", type: :request do
  describe "GET /newsletters" do
    it "works! (now write some real specs)" do
      get newsletters_path
      expect(response).to have_http_status(200)
    end
  end
end
