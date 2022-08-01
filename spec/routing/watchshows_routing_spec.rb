require "rails_helper"

RSpec.describe WatchshowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/watchshows").to route_to("watchshows#index")
    end

    it "routes to #show" do
      expect(get: "/watchshows/1").to route_to("watchshows#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/watchshows").to route_to("watchshows#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/watchshows/1").to route_to("watchshows#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/watchshows/1").to route_to("watchshows#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/watchshows/1").to route_to("watchshows#destroy", id: "1")
    end
  end
end
