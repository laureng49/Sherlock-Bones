class DogsController < ApplicationController
  def new
    @status = params[:status]
    @breeds = Breed.all
    @color = Color.all
    @size = ["Small", "Medium", "Large"]
    @age = ["Young", "Adult", "Senior"]
    @gender = ["Male", "Female"]
    @dog = Dog.new
  end

  def create
    form = params[:dog]
    status = form[:status]
    breed = Breed.find(form[:breed_id])
    color = Color.find_by(color:form[:color])

    puts color
    user = User.find(session[:user_id])
    dog = Dog.new(dog_params)
    dog.user = user
    dog.color = color
    dog.status = status



    if dog.valid? && params[:address]
      puts "pppppppppppppppppppppppppppppppppppppppppppppppppp"
      dog.save
      loc = Location.new(address:params[:address], user:user, dog:dog)
       loc.save
       puts loc.address
      flash[:msg] = "Successfully created dog!"
      if dog.status == 'Lost'
        redirect_to '/lost/index'
      else
        redirect_to '/found/index'
      end
    else
      flash[:msg] = dog.errors.full_messages
      puts 'pp************' * 50
      puts flash[:msg]
      puts '**************' * 50
      redirect_to :back
    end
  end

  def loc
    id = params[:id]
    dog = Dog.find(id)
    user = User.find(session[:user_id])
    loc = Location.new(user:user, dog:dog, address:params[:location])
    if loc.valid?
      loc.save
      redirect_to '/main'
    else
      flash[:msg] = temp.errors.full_messages
      redirect_to :back
    end
  end

  def success
    id = params[:id]
    dog = Dog.find(id)
    ttest = Date.today-dog.date
    user = User.find(session[:user_id])
    temp = Success.new(user:user, address:params[:location])
    temp.time_lost = ttest

    if temp.valid?
      temp.save
      dog.destroy
      redirect_to '/main'
    else
      flash[:msg] = temp.errors.full_messages
      redirect_to :back
    end
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :reward, :breed_id, :size, :age, :gender, :description, :date, :time, :status, :picture)
  end
end
