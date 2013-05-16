class Common::TrailsController < ApplicationController
  before_action :set_common_trail, only: [:show, :edit, :update]
  before_action :authorize_admin, except: [:index, :show]
  
  def index
  end
  
  def show
    if logged_in?
      @update = current_user.updates.build
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @trail = Common::Trail.new
  end
  
  def create
    @trail = Common::Trail.new(trail_params)
    if @trail.save
      redirect_to(edit_common_trail_path(@trail))
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @trail.update_attributes(trail_params)
      redirect_to(common_trail_path(@trail))
    else
      redirect_to(edit_common_trail_path(@trail))
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_common_trail
    @trail = Common::Trail.find(params[:id])
  end
  
  def trail_params
    params.require(:common_trail).permit(:description, :length, :name, :state_id, 
      { activity_ids: [] })
  end
  
end
