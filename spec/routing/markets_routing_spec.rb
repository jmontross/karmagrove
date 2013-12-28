require "spec_helper"

describe MarketsController do
  describe "routing" do

    it "routes to #index" do
      get("/markets").should route_to("markets#index")
    end

    it "routes to #new" do
      get("/markets/new").should route_to("markets#new")
    end

    it "routes to #show" do
      get("/markets/1").should route_to("markets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/markets/1/edit").should route_to("markets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/markets").should route_to("markets#create")
    end

    it "routes to #update" do
      put("/markets/1").should route_to("markets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/markets/1").should route_to("markets#destroy", :id => "1")
    end

  end
end
