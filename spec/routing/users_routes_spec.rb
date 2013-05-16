require "spec_helper"

describe "User routes" do
  it "route to new users page" do
    { get: "/users/new" }.should route_to(controller: "users", action: "new")
  end

  it "route to edit user page" do
    { get: "/users/1/edit" }.should route_to(controller: "users", action: "edit", id: "1")
  end

  it "route to show user page" do
    { get: "/users/1" }.should route_to(controller: "users", action: "show", id: "1")
  end

  it "route to user create page" do
    { post: "/users" }.should route_to(controller: "users", action: "create")
  end

  it "route to user update page" do
    { patch: "/users/1" }.should route_to(controller: "users", action: "update", id: "1")
  end

  it "route to invite user page" do
    { get: "/invite_user" }.should route_to(controller: "users", action: "invite_user")
  end

  it "route named new users page" do
    { get: new_user_path }.should route_to(controller: "users", action: "new")
  end

  it "route named edit users page" do
    { get: edit_user_path(1) }.should route_to(controller: "users", action: "edit", id: "1")
  end

  it "route named show users page" do
    { get: user_path(1) }.should route_to(controller: "users", action: "show", id: "1")
  end
  
  it "route named invite user page" do
    { get: invite_user_path }.should route_to(controller: "users", action: "invite_user")
  end
  
  
end