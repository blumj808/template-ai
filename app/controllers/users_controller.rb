class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new({ :username => params[:user]['username'], :password => params[:user]['password'], :password_confirmation => params[:user]['password_confirmation'],:role => params['role'] })
    if @user.save
      session.store(:user_id, @user.id)
      redirect_to("/",notice: "Account created successfully!")
    else
      render :new
    end
  end
end
