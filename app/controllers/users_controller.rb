class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], age: params[:age])
		@user.save

		if @user.save
		  @user.authenticate(@password)
		  flash[:success] = "Your account has been succesfully created !"
		  redirect_to root_path, notice: "Account created"

		else
			flash[:danger] = "Couldn't create an account : #{@user.errors.messages}"
		  render :new
		end
	end

	def index

	end

	def authenticate
	  unless current_user
	    flash[:danger] = "Please log in."
	    redirect_to new_session_path
	  end
	end

	def show
		
	end


end

