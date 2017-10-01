require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/session/new").to route_to("sessions#new")
    end

    it "routes to #create" do
      expect(:post => "/session").to route_to("sessions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/session").to route_to("sessions#destroy")
    end
  end
end
