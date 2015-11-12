class PostsController < ApplicationController

	def index
		@user = User.find_by_id(session[:user_id])
		@post = @user.posts.last
		@posts = @user.posts
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
		redirect_to user_posts_path(@user)
	end

	def list_10
		current_user
		@listposts = Post.order(id: :desc).limit(10)
		@user = User.find_by_id(session[:user_id])
	end

		private
	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end
end
 