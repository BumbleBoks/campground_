class Common::MissingTrailsController < ApplicationController
  before_action :authorize_user, only: [:create]
  
  
  def create
    @missing_trail = Common::MissingTrail.new(missing_trail_create_params)
    @missing_trail.user_name = current_user.name
    @missing_trail.user_email = current_user.email
    if @missing_trail.save 
      UserMailer.add_trail_message(@missing_trail).deliver
      flash[:success] = "Missing trail info has been recorded."
    else
      flash[:error] = "Could not record the info on missing trail."
    end
    redirect_to :back
  end
  
  private
  
  def missing_trail_create_params
    params.require(:common_missing_trail).permit(:info)
  end  
end
