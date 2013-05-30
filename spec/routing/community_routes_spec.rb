require "spec_helper"

describe "Community pages routes" do
  it "route to updates create page" do
    { post: "/community/updates" }.should route_to(controller: "community/updates", action: "create")
  end
  
  it "route to trades index page" do
    { get: "/community/trades" }.should route_to(controller: "community/trades", action: "index")
  end

  it "route to trades show page" do
    { get: "/community/trades/1" }.should route_to(controller: "community/trades", action: "show", id: "1")
  end

  it "route to trades new page" do
    { get: "/community/trades/new" }.should route_to(controller: "community/trades", action: "new")
  end

  it "route to trades create page" do
    { post: "/community/trades" }.should route_to(controller: "community/trades", action: "create")
  end

  it "route to trades edit page" do
    { get: "/community/trades/1/edit" }.should route_to(controller: "community/trades", action: "edit", id: "1")
  end

  it "route to trades update page" do
    { patch: "/community/trades/1" }.should route_to(controller: "community/trades", action: "update", id:"1")
  end
  
  it "route to trades show page" do
    { get: "/community/trades/1" }.should route_to(controller: "community/trades", action: "show", id: "1")
  end

  it "route named trades index page" do
    { get: community_trades_path }.should route_to(controller: "community/trades", action: "index")
  end
  
  it "route named trades show page" do
    { get: community_trade_path(1) }.should route_to(controller: "community/trades", action: "show", id: "1")
  end
  
  it "route named trades new page" do
    { get: new_community_trade_path }.should route_to(controller: "community/trades", action: "new")
  end

  it "route named trades edit page" do
    { get: edit_community_trade_path(1) }.should route_to(controller: "community/trades", action: "edit", id: "1")
  end

end