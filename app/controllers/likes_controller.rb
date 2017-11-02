class LikesController < ApplicationController

  def index
    @likes = Like.where(user_id: params[:id])
  end
  
  def new
    @like = Like.create({user: current_user, place: Place.find(params[:id])})
    @like.user = current_user
    if @like.save
      redirect_to places_path
    else
      render root_path
    end
  end

  def destroy
    @like = Like.find_by(user_id: params[:id])
    if @like.destroy
      redirect_to places_path
    end

  end

end