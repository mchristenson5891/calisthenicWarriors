class PlacesController < ApplicationController

  def index
    @places = Place.all

  end

  def new
    @place = Place.new
  end

  def edit
    @place = Place.find(params[:id])
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
    @like = Like.new
  end


  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(place_params)
      redirect_to place_path(@place.id)
    else
      render :new
    end
  end

  def add
    @place = Place.find(params[:id])
    @place.users << current_user
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    current_user.places.delete(Place.find(params[:id]))
    redirect_to root_path
  end


  private
  def place_params
    params.require(:place).permit(:name, :location, :photo, :equipment, :id)
  end

end