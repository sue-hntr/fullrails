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
			render :new
		end
	end

	def edit
		@user = current_user
		session[:user_id] = @user.id
	end


	def update
		# @user = current_user
		if 	@user.update(user_params)
			redirect_to users_path
		else
			render :edit
		end
	end


	def show
		@user = current_user
		session[:user_id] = @user.id
	end


	def destroy
		@user = User.find(params[:id])
		flash[:alert] = "Your account is deleted."
		@user.destroy
		session[:user_id] = nil
		redirect_to root_path
	end



	private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end