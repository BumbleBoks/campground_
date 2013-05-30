class Community::TradesController < ApplicationController
  before_action :set_community_trade, only: [:show, :edit, :update]
  before_action :authorize_user
  
  def index    
  end
  
  def show    
  end
  
  def new    
  end
  
  def create
  end

  def edit    
  end
  
  def update    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_trade
      @community_trade = Community::Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_trade_params
      params.require(:community_trade).permit(:trade_type, :gear, :description, :activity_id,
        :trade_location, :min_price, :max_price, :completed)
    end
end
