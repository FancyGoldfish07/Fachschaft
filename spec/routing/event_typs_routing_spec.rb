require "rails_helper"

RSpec.describe EventTypsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_typs").to route_to("event_typs#index")
    end

    it "routes to #new" do
      expect(:get => "/event_typs/new").to route_to("event_typs#new")
    end

    it "routes to #show" do
      expect(:get => "/event_typs/1").to route_to("event_typs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_typs/1/edit").to route_to("event_typs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_typs").to route_to("event_typs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_typs/1").to route_to("event_typs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_typs/1").to route_to("event_typs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_typs/1").to route_to("event_typs#destroy", :id => "1")
    end

  end
end
