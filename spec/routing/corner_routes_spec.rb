require "spec_helper"

describe "Corner pages routes" do
  it "route to user favorites show page" do
    { get: "/favorites/show" }.should route_to(controller: "corner/favorites", action: "show")
  end
  
  it "route to user favorites new page" do
    { get: "/favorites/new" }.should route_to(controller: "corner/favorites", action: "new")
  end
  
  it "route to user favorites create page" do
    { post: "/corner/favorites" }.should route_to(controller: "corner/favorites", action: "create")
  end

  it "route to user favorites add trail page" do
    { post: "/corner/favorites/add_trail" }.should route_to(controller: "corner/favorites", 
      action: "add_trail")
  end
  
  it "route to user favorites remove trail page" do
    { post: "/corner/favorites/remove_trail" }.should route_to(controller: "corner/favorites", 
      action: "remove_trail")
  end
  
  it "route named user favorites show page" do
    { get: favorites_show_path }.should route_to(controller: "corner/favorites", action: "show")
  end
  
  it "route named user favorites new page" do
    { get: favorites_show_path }.should route_to(controller: "corner/favorites", action: "show")
  end

  it "route named user favorites create page" do
    { post: corner_favorites_path }.should route_to(controller: "corner/favorites", action: "create")
  end

  it "route named user favorites add trail page" do
    { post: corner_favorites_add_trail_path }.should route_to(controller: "corner/favorites", 
      action: "add_trail")
  end
  
  it "route named user favorites remove trail page" do
    { post: corner_favorites_remove_trail_path }.should route_to(controller: "corner/favorites", 
      action: "remove_trail")
  end
end