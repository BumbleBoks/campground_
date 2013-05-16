require "spec_helper"

describe "Common pages routes" do
  it "route to trails index page" do
    { get: "/common/trails" }.should route_to(controller: "common/trails", action: "index")
  end

  it "route to new trails page" do
    { get: "/common/trails/new" }.should route_to(controller: "common/trails", action: "new")
  end

  it "route to edit trail page" do
    { get: "/common/trails/1/edit" }.should route_to(controller: "common/trails", action: "edit", id: "1")
  end

  it "route to show trail page" do
    { get: "/common/trails/1" }.should route_to(controller: "common/trails", action: "show", id: "1")
  end

  it "route to trails create page" do
    { post: "/common/trails" }.should route_to(controller: "common/trails", action: "create")
  end

  it "route to trails update page" do
    { patch: "/common/trails/1" }.should route_to(controller: "common/trails", action: "update", id: "1")
  end

  it "route named trails index page" do
    { get: common_trails_path }.should route_to(controller: "common/trails", action: "index")
  end

  it "route named new trails page" do
    { get: new_common_trail_path }.should route_to(controller: "common/trails", action: "new")
  end

  it "route named edit trail page" do
    { get: edit_common_trail_path(1) }.should route_to(controller: "common/trails", action: "edit", id: "1")
  end

  it "route named show trail page" do
    { get: common_trail_path(1) }.should route_to(controller: "common/trails", action: "show", id: "1")
  end

end