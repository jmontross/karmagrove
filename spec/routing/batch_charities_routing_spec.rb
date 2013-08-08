require "spec_helper"

describe BatchCharitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/batch_charities").should route_to("batch_charities#index")
    end

    it "routes to #new" do
      get("/batch_charities/new").should route_to("batch_charities#new")
    end

    it "routes to #show" do
      get("/batch_charities/1").should route_to("batch_charities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/batch_charities/1/edit").should route_to("batch_charities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/batch_charities").should route_to("batch_charities#create")
    end

    it "routes to #update" do
      put("/batch_charities/1").should route_to("batch_charities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/batch_charities/1").should route_to("batch_charities#destroy", :id => "1")
    end

  end
end
