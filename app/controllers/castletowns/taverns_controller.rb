class Castletowns::TavernsController < ApplicationController
	before_action :logged_in_user, only: [:index]   
  #before_action :correct_user,   only: [:index, :about]
  #before_action :admin_user,     only: [:destroy, :create]

  include UsersHelper

  def index
    @users = User.paginate(page: params[:page]).order('first_name ASC')
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end

  def only_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end