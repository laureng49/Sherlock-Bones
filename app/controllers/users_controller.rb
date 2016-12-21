class UsersController < ApplicationController
  def create
    u=User.new(name: params[:name], email: params[:email], password: params[:password])
    if(u.valid?)
      u.save
      redirect_to '/main'
    else
      flash[:errors]=u.errors.full_messages
      redirect_to :back
    end
  end

  def show
  end

  def main
  end
end
