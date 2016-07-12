class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    # binding.pry
    @attraction = Attraction.find(params[:id])
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
