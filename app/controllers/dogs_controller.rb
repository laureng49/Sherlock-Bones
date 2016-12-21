class DogsController < ApplicationController
  def new
    @status = params[:status]
    @breeds = Breed.all
    @color = Color.all
    @size = ["Small", "Medium", "Large"]
    @age = ["Young", "Adult", "Senior"]
    @gender = ["Male", "Female"]
  end

  def create
    form = params[:dog]
    status = form[:status]
    breed = Breed.find(form[:breed_id])
    color = Color.find_by(color:form[:color])

    puts color
    user = session[:user_id]
    dog = Dog.new(dog_params)
    dog.user = user
    dog.color = color
    dog.status = status
    puts '**************' * 50
    puts dog.status
    puts '**************' * 50

    if dog.valid?
      dog.save
      flash[:msg] = "Successfully created dog!"
      if dog.status == 'Lost'
        redirect_to '/lost/index'
      else
        redirect_to '/found/index'
      end
    else
      flash[:msg] = dog.errors.full_messages
      puts '**************' * 50
      puts flash[:msg]
      puts '**************' * 50
      redirect_to :back
    end
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :reward, :breed_id, :size, :age, :gender, :description, :date, :time, :status)
  end
end
