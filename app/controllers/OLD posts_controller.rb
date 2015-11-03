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
		@user = current_user.username
		@post = Post.new
	end

	def create

	#	Post.user_id = session[:user_id]

	puts params
		@post = Post.new(post_params)
		puts "XXXXXXXXXXXXX"
		puts post_params
		@user = current_user
		# title = params[:title]
		# body = params[:body]
		@post = Post.create(post_params)
		flash[:notice] = "Thanks for the tip. Dish me some more..."
		@user.posts << @post
		puts "YYYYYYYYYYYYYYY"
		puts @post.id
		puts @user.id
		puts @user.posts
		binding.pry
		redirect_to posts_path
	end



	def show
		@user = User.find_by_id(session[:user_id])
		@post = Post.all()
	end



		private
	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end



end
