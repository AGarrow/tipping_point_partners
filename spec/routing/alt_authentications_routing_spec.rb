require "spec_helper"

describe AltAuthenticationsController do
  describe "routing" do

    it "routes to #index" do
      get("/alt_authentications").should route_to("alt_authentications#index")
    end

    it "routes to #new" do
      get("/alt_authentications/new").should route_to("alt_authentications#new")
    end

    it "routes to #show" do
      get("/alt_authentications/1").should route_to("alt_authentications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/alt_authentications/1/edit").should route_to("alt_authentications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/alt_authentications").should route_to("alt_authentications#create")
    end

    it "routes to #update" do
      put("/alt_authentications/1").should route_to("alt_authentications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/alt_authentications/1").should route_to("alt_authentications#destroy", :id => "1")
    end

  end
end
