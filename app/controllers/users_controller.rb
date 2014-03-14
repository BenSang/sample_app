class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def show
    @user = User.find(1)
  end

   def create
    @user = User.new(user_params)
    p @user
    p "================================================"
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      render 'show'
    else
      render 'new'
    end
  end

    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end

