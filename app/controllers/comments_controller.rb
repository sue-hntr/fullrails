class CommentsController < ApplicationController


	def current_post
		@current_post = Post.find(post_params.id)
	end


	def on_post
		@posts = Post.all
		@post = Post.find_by_id(params[:post_id])
		@user = User.find_by_id(session[:user_id])
	end	

	def index
		@post = Post.find_by_id(params[:post_id])
		@commentlist = Comment.order(id: :desc)
		current_user
	end	

	def new
		@user = current_user
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.new #(comment_params)
		@user = current_user
		@post = Post.find(params[:post_id])
		@comment = Comment.create(comment_params)
		flash[:notice] = "Your comment is saved"
		@post.comments << @comment
		redirect_to user_post_comments_path(@post.id, @user.id)
	end

	def show
		@user = current_user
		@post = current_post
		@comment = Comment.find(params[:comment_id])
	end


private 

	def comment_params
		params.require(:comment).permit(:comment, :post_id)
	end

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

end
