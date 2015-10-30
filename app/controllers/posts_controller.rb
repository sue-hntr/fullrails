class PostsController < ApplicationController


	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end


	def index
		@post = Post.all()
	end


	def new
		@post = Post.new
	end

	def create
		title = params[:title]
		body = params[:body]
		id = session[:user_id]
		@post = Post.create(title: params[:title], body: params[:body], user_id: id)
		flash[:notice] = "Thanks for the tip. Dish me some more..."
		redirect_to posts_path
	end



	def show
		@user = User.find_by_id(session[:user_id])
		@post = Post.all()
	end



		private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end
