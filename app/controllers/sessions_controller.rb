class SessionsController < ApplicationController

  def authenticate
  	if params[:username]
      user = User.find_by_username(params[:username])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      flash[:notice] = "Logged In!"
	      p "fjsalfjfklsajf839j93jfkfsfasfjjklsajfklsajfklasjlfk;jsalkfjsl;f"
	      redirect_to root_url
	    else
	      p "incorrect"
          flash[:notice] = "Invalid username or password"
          redirect_to root_url
        end
    else
      redirect_to root_url
  	end
  end

  def login_page
  end


  def destroy
  	session.clear
  	redirect_to root_url, :notice => "Logged out!"
  end

end
