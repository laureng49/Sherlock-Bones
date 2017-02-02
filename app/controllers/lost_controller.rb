class LostController < ApplicationController
  def create
  end

  def index
    @current_user= User.find(session[:user_id])
    @dogs=Dog.includes(:breed).includes(:color).includes(:user).where(status:"Lost").select("*")
  end

  def show
  end
end
