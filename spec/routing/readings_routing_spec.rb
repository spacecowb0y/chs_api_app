require "rails_helper"

RSpec.describe ReadingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/readings").to route_to("readings#index")
    end

    it "routes to #show" do
      expect(:get => "/readings/1").to route_to("readings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/readings").to route_to("readings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/readings/1").to route_to("readings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/readings/1").to route_to("readings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/readings/1").to route_to("readings#destroy", :id => "1")
    end
  end
end
