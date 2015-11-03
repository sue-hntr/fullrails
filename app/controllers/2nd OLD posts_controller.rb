class PostsController < ApplicationController


	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end



	def new
		@user = current_user.username
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@user = current_user
		@post = Post.create(post_params)
		flash[:notice] = "Your post is saved."
		@user.posts << @post
		redirect_to post_path
	end

#This should be SHOW 
	def index
		@user = User.find_by_id(session[:user_id])
		@post = @user.posts.last
		@posts = @user.posts.all()
	end





#This should be INDEX
	def show
		p = Post.last.id
		@v = Post.last.id - 10
		@listpost = Post.find.(@v)
		@posts = Posts.all()
	end



		private
	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end



end
