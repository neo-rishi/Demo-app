class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate
	def index
		@posts = User.find_by_email(session[:email]).posts
	end

	def new
		@post = Post.new
	end

	def create
		@post = User.find_by_email(session[:email]).posts.build(params_post)
		if @post.save
			redirect_to posts_path
		else
			render 'index'
		end
	end

	def show

		@post = Post.find(params[:id])
		@comment = @post.comments.build
	end

	def edit

	end

	def update

    respond_to do |format|
      if @post.update(params_post)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
	end

	def destroy
		if @post.delete
			redirect_to posts_path, notice: 'Post was sucessfuly destroy..'
		else
			redirect_to posts_path, notice: 'Post not deleted'
		end
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def params_post
		params.require(:post).permit(:name,:user_id)
	end

end
