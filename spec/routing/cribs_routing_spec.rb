require "rails_helper"

RSpec.describe CribsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cribs").to route_to("cribs#index")
    end

    it "routes to #new" do
      expect(:get => "/cribs/new").to route_to("cribs#new")
    end

    it "routes to #show" do
      expect(:get => "/cribs/1").to route_to("cribs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cribs/1/edit").to route_to("cribs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cribs").to route_to("cribs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cribs/1").to route_to("cribs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cribs/1").to route_to("cribs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cribs/1").to route_to("cribs#destroy", :id => "1")
    end

  end
end
