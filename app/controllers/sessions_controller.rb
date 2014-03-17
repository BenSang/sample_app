class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user.password_digest == params[:session][:password_digest]
      sign_in user
      redirect_back_or user
    else
      flash.now[:error]= 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
