class UsersController < ApplicationController
  
    def new
      @user = User.new
    end

    def index    
      @users = User.all
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
          redirect_to user_path(@user.id)
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, notice: 'Logged out!'
    end


    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :id, :description)
    end

  end
