class SessionsController < ApplicationController

def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end



def new
	@user = User.new
end



def create
	user_info = params[:user]
	username = user_info[:username]
	pass = user_info[:password]
	@user = User.where(username: username).first
	# puts "XXXXXXXXXXXXXXXXXXXXXX"
	# puts @user.password
	# puts "YYYYYYYYYYYYYYYYYYYYYY"
	# puts user_info
	# puts "ZZZZZZZZZZZZZZZZZZZZZZZ"
	# puts username
	if @user == nil
		flash[:alert] = "Not on list. Please sign up."
		redirect_to new_user_path
	elsif @user.password != pass
		flash[:alert] = "Username/Password mismatch. Please try again."
	    redirect_to login_path
	else
		session[:user_id] = @user.id
		redirect_to users_path
		return
	end
end


def destroy
	username = params[:username]
	flash[:alert] = "You are signed out."
	session[:user_id] = nil
	redirect_to root_path
end

end