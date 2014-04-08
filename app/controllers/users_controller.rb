class UsersController < ApplicationController

  respond_to :json

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end


end
