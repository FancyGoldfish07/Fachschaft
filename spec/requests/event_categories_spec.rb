require 'rails_helper'

RSpec.describe "EventCategories", type: :request do
  describe "GET /event_categories" do
    it "works! (now write some real specs)" do
      get event_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
