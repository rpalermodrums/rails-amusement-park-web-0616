class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  def show
    # binding.pry
    @user = User.find(params[:id])
    session[:user_id] = @user.id
  end

  def update
    @user = User.find(params[:id])
    tic = @user.tickets
    @ride = @user.rides.last
    @ride.take_ride
    @attraction = @ride.attraction
    if tic != @user.tickets
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:notice] = @ride.take_ride
    end
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :tickets, :happiness, :nausea, :height, :admin)
    end
end
