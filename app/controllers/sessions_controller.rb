class SessionsController < ApplicationController



	def new
		
	end



	def create
		  
		  user = User.find_by(@email)

		  	if user && user.authenticate(params[:password])
		  	  session[:user_id] = user.id
		  	  flash[:success] = "Log in !"
		  	  redirect_to root_path, notice: "Log in !"

		  	else
		  	  flash.now[:danger] = "Invalid email/password combination #{@user.errors.messages}"
		  	  render 'new'
		  	end
	end



	def destroy
		session.delete(:user_id)
	end


end