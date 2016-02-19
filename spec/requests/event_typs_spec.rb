require 'rails_helper'

RSpec.describe "EventTyps", type: :request do
  describe "GET /event_typs" do
    it "works! (now write some real specs)" do
      get event_typs_path
      expect(response).to have_http_status(200)
    end
  end
end
