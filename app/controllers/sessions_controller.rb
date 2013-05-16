class SessionsController < ApplicationController
  def new    
  end
  
  def create
    user = User.find_by(login_id: params[:login_id].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to(root_path)
    else
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to(root_path, success: "Logged out!")
  end
end
