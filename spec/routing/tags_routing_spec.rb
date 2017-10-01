require "rails_helper"

RSpec.describe TagsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/tags/mytag34").to route_to("tags#show", :name => "mytag34")
    end
  end
end
