class SessionsController < ApplicationController
  def create
    user = User.where({ :username => params['username'] }).at(0)
    
    if user && user.authenticate(params['password'])
      session.store(:user_id, user.id)
      redirect_to("/")
    else
      flash[:alert] = "Invalid username or password"
      redirect_to("/")
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out!"
  end
end
