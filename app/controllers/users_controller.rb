class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:id] = user.id
  		redirect_to user_path(user.id)
  	else
  		redirect_to root_path
  	end
  end

  def new
  	@user = User.new
  end


  def show
  	@user = User.where(id:params[:id]).first
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

