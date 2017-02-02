class UsersController < ApplicationController
  def create
    u=User.new(name: params[:name], email: params[:email], password: params[:password])
    if(u.valid?)
      u.save
      session[:user_id] = u.id
      redirect_to '/main'
    else
      flash[:errors]=u.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(session[:user_id])
    @dogs = Dog.where(user:@user)
  end

  def main
    @locations = Location.all
    @success = Success.all
    puts @locations

    @hash = Gmaps4rails.build_markers(@locations) do |loc, marker|
      # marker.title loc.dog.name
      marker.lat loc.latitude
      marker.lng loc.longitude
    end
    @suc = Gmaps4rails.build_markers(@success) do |loc, marker|
      marker.lat loc.latitude
      marker.lng loc.longitude
    end
  end
  end
