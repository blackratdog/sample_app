class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #sign in and rediret to user's show page

    else
      #Create error message and show sign in form again
      flash.now[:error] = 'Invalid email / password combination'
      render 'new'
    end
  end

  def destroy
  end

end
