require "spec_helper"

describe BuddhasController do
  describe "routing" do

    it "routes to #index" do
      get("/buddhas").should route_to("buddhas#index")
    end

    it "routes to #new" do
      get("/buddhas/new").should route_to("buddhas#new")
    end

    it "routes to #show" do
      get("/buddhas/1").should route_to("buddhas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/buddhas/1/edit").should route_to("buddhas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/buddhas").should route_to("buddhas#create")
    end

    it "routes to #update" do
      put("/buddhas/1").should route_to("buddhas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/buddhas/1").should route_to("buddhas#destroy", :id => "1")
    end

  end
end
