class UsersController < ApplicationController
  before_action :guest_user, :only => [:new, :create, :invite_user]
  before_action :authorize_user, :only => [:show, :edit, :update, :destroy]
  before_action :account_owner, :only => [:edit, :update, :destroy]
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def invite_user    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_message(@user).deliver
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @page = params[:page] || 1
  end

  def update   
    if @user.update_partial_attributes(user_params) 
      if params[:page].present? && params[:page].to_i.eql?(2)
        redirect_to edit_user_path(@user)
      else  
        redirect_to @user
      end
    else
      @page = params[:page]
      render 'edit'
    end
  end
  
  def destroy
    @user.delete
    redirect_to root_path
  end

  private
  def account_owner
    @user = User.find_by(id: params[:id])
    unless current_user?(@user)
      redirect_to root_path
      false
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :login_id, :name, :current_password, :password, :password_confirmation)
  end
  
end
