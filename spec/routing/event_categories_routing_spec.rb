require "rails_helper"

RSpec.describe EventCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_categories").to route_to("event_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/event_categories/new").to route_to("event_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/event_categories/1").to route_to("event_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_categories/1/edit").to route_to("event_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_categories").to route_to("event_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_categories/1").to route_to("event_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_categories/1").to route_to("event_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_categories/1").to route_to("event_categories#destroy", :id => "1")
    end

  end
end
