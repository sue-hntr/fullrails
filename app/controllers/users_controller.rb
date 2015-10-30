class UsersController < ApplicationController


	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end


	def index
		 @current_user = User.find(session[:user_id])

	end

	def new
		@user = User.new
	end


	def create   
		@user = User.new(user_params) 
		if @user.save
			redirect_to login_path
		else 	
			flash[:alert] = "no good"
		end
	end

	def edit
		@user = current_user
		session[:user_id] = @user.id

	end

	def update
		if 	@user.update(username: params[:username], password: params[:password])
			redirect_to users_path
		else
			render :edit
		end
	end


	def show
		@user = current_user
		session[:user_id] = @user.id
	end


	def delete
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path	
	end

def some_action   
	respond_to do |script|
	     script.js
	 end 
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end