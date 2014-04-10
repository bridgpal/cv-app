class SessionController < ApplicationController

  def new
  end

  def create
    session[:user_id] = 'harry' # TODO

    redirect_to root_url
  end

end