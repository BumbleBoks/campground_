class Corner::LogsController < ApplicationController
  before_action :authorize_user
  
  def new
    @log = current_user.logs.build
  end
  
  def create      
    @log = current_user.logs.build(log_params)
    if @log.save
      flash[:success] = "Log successfully added"
      redirect_to generate_log_path(@log)
    else
      render 'new'
    end
  end
    
  def show
    @log = current_user.logs.find_by(log_date: Date.new(params[:year].to_i, 
      params[:month].to_i, params[:day].to_i))
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  private 
  
  def log_params
    params.require(:corner_log).permit(:activity_id, :content, :log_date, :title)
  end
  
end
