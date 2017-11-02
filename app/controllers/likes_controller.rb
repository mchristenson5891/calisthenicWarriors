class LikesController < ApplicationController

  def index
    @likes = Like.where(user_id: params[:id])
  end
  
  def new
    @like = Like.create({user: current_user, place: Place.find(params[:id])})
    if @like.save
      redirect_to place_path(params[:id])
    else
      render root_path
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id)
    @like.destroy
    if @like.destroy
      redirect_to place_path(params[:id])
    end

  end

end