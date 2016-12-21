class FoundController < ApplicationController
  def create
  end

  def index
    @current_user= User.find(session[:user_id])
    @dogs=Dog.where(status:"Found")
  end

  def show
  end
end
