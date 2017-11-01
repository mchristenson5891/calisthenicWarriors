class PlacesController < ApplicationController

  def index
    @places = Place.all

  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      hjjsdf
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @user.places_id = params[:id]
    if @user.save
      redirect_to root_path
    end
  end

  def add
    @place = Place.find(params[:id])
    @place.users << current_user
    redirect_to root_path
  end


  private
  def place_params
    params.require(:place).permit(:name, :location, :photo, :equipment, :id)
  end

end