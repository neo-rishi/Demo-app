class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	#show all users post that folloing by current user
	def index
		@post = Post.new
		@check_fav = current_user.favourites.pluck(:post_id)
		users = current_user.followings.pluck(:id)
		users << current_user[:id]
		@posts = Post.where(user_id: users).order('id DESC').includes(:user)
		@tweets = current_user.posts.count
		@followings_count = current_user.followings.count
		@followings = current_user.followings.last(5)
		@follows = User.where("id NOT IN (?)", users).first(5)
		@followers = current_user.followers.last(5)
		@user_name = current_user
	end

	#create new post
	def create
		@post = current_user.posts.build(params_post)
		@check_fav = current_user.favourites.pluck(:post_id)
		@user_name = current_user
		respond_to do |format|
			if @post.save
				format.js
				#redirect_to posts_path
			else
				render 'new'
			end
		end
	end
	#show your post and create comment
	def show
		@post = Post.find(params[:id])
		@comment = @post.comments.build
	end
	#update your posts
	def update
		respond_to do |format|
      if @post.update(params_post)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
	end

	#destroy your post
	def destroy
		if @post.destroy
			redirect_to posts_path, notice: 'Post was sucessfuly destroy..'
		else
			redirect_to posts_path, notice: 'Post not deleted'
		end
	end
	#Increase Post vote
	def post_vote_up
		@post = Post.find(params[:id])
		respond_to do |format|
			@post.vote = @post.vote + 1
			@post.save
			format.js
		end
	end
  #decrease Post vote
	def post_vote_down
		@post = Post.find(params[:id])
		respond_to do |format|
			@post.vote = @post.vote - 1
			@post.save
			format.js
		end
	end
	#refresh user profile in post index page
	def user_profile_refresh
			@followings = current_user.followings.last(5)
			respond_to do |format|
				format.js
			end
	end

	def user_follow_refresh
		users = current_user.followings.pluck(:id)
		users << current_user[:id]
		@follows = User.where("id NOT IN (?)", users).first(5)
			respond_to do |format|
				format.js
			end
	end
	#use for favourites post
	def favourite
		@favourite_check = current_user.favourites.where("user_id = ? and post_id = ? ",current_user.id, params[:id])
		@favourite = current_user.favourites.build(post_id: params[:id])
		respond_to do |format|
			if @favourite_check.exists?
				@favourite_check.delete_all
				format.js
			else
				@favourite.save
				format.js
			end
		end
	end
	private
	#find post byid
	def set_post
		@post = Post.find(params[:id])
	end
	#this function use for permission for new post
	def params_post
		params.require(:post).permit(:title)
	end

end
