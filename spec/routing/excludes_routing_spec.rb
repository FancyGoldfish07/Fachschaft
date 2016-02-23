require "rails_helper"

RSpec.describe ExcludesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/excludes").to route_to("excludes#index")
    end

    it "routes to #new" do
      expect(:get => "/excludes/new").to route_to("excludes#new")
    end

    it "routes to #show" do
      expect(:get => "/excludes/1").to route_to("excludes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/excludes/1/edit").to route_to("excludes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/excludes").to route_to("excludes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/excludes/1").to route_to("excludes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/excludes/1").to route_to("excludes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/excludes/1").to route_to("excludes#destroy", :id => "1")
    end

  end
end
