class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(name: login_params[:name])
    if @user && @user.authenticate(params[:password])
      login_as(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


  private
  def login_params
    params.permit(:name, :password)
  end
end
