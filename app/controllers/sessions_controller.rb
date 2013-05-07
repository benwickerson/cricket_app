class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
      flash[:success] = "Welcome back, #{user.name}"
    else
      flash.now[:error] = "Invalid email/password combination is wrong"
      render 'new'
    end    
  end

  def destroy
    sign_out
    redirect_to root_url
    flash[:success] = "Thank you for playing Cricket - hope you come again soon."
  end

end
