class SessionsController < ApplicationController

def new
	# binding.pry
	@user = User.new
	# @user = User.new
end



def create
	# binding.pry
	user_info = params[:user]
	username = user_info[:username]
	pass = user_info[:password]
	puts "password is : #{pass}"
	@user = User.where(username: username).first
	puts "U PASSWORD IS: #{@user}"
	if @user.password == pass
		session[:user_id] = @user.id
		redirect_to users_path
	else
		flash[:notice] = "Not on list. Please sign up."
		redirect_to root_path
		return
	end
end


def destroy
	username = params[:username]
	flash[:notice] = "#{username}, signed out."
	session[:user_id] = nil
	redirect_to root_path
end

end