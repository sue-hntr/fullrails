class CommentsController < ApplicationController

	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def current_post
		@current_post = Post.find(post_params.id)
	end


	def index
		@posts = Posts.all
		@user = User.find_by_id(session[:user_id])
# on post. select, redirect_to new_comment_path  		
	end	


	def new
		@user = current_user.username
		@post = current_post
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@user = current_user.username
		@post = current_post
		@comment = Comment.create(comment_params)
		flash[:notice] = "Your comment is saved"
		@post.comments << @comment
		redirect_to 	











	def comment_params
		params.require(:comment).permit(:comment)

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

end
