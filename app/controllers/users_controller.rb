class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    role = params['role'].present? ? params['role'] : User::GUEST_ROLE
    @user = User.new({ :username => params['username'], :password => params['password'], :role => role })
    if @user.save
      session.store(:user_id, @user.id)
      redirect_to("/",notice: "Account created successfully!")
    else
      render :new
    end
  end
end
