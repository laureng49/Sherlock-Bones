class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by_email(params[:email])
    if (u && u.authenticate(params[:password]))
      session[:user_id] = u.id
      redirect_to "/main"
    else
      flash[:error] = "Invalid login information!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
