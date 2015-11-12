class PostsController < ApplicationController

	def index 
		@posts = Post.all
	end

	def new
		@post = Post.new
		@category = Category.all

	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "Your post is saved"
		else
			render "new"

		end
	end

	def edit
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to posts_path, :notice => "Your Post is Updated"
		else
			render "edit"
		end

	end

	def show
		@post = Post.find(params[:id])

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post is Deleted"
	end



end
