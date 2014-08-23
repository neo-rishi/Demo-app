class UsersController < ApplicationController
  autocomplete :user, :name
	before_action :user_params, only: [:create]
  before_action :authenticate_user!, except: [:create, :login, :new, :signin]

  session ={id: ''} #It is hold session
  def index
    @users = User.all
    @users_id = current_user.users_followings.pluck(:follower_id)
  end
#show user profile
def show
  @user = User.find(params[:id])
  @user_name = @user
  @posts = @user.posts
  @post = Post.new
  @check_fav = @user_name.favourites.pluck(:post_id)
  users = @user_name.followings.pluck(:id)
  users << @user_name[:id]
  @tweets = @user_name.posts.count
  @followings_count = @user_name.followings.count
  @followings = @user_name.followings.last(5)
  @follows = User.where("id NOT IN (?)", users).first(5)
  @followers = @user.followers.last(5)
end
#update profile information
  def update_profile
    if current_user.profile.present?
      @profile = current_user.profile
    else
     current_user.build_profile.save
     @profile = current_user.profile
    end
  end
  def update_profile_method
    respond_to do |format|
      if current_user.profile.present?
        if current_user.profile.update(profile_param)
          format.html { redirect_to posts_path, notice: 'Profile was successfully updated.' }
        else
          format.html { render :'update_profile' }
        end
      else
        @profile = current_user.build_profile(profile_param)
        @profile.save
        format.html { redirect_to posts_path, notice: 'Profile was successfully updated.' }
      end
    end
  end

  def search_user
   @users = User.where("name like ?", "%#{params[:data]}%")
    respond_to do |format |
      format.js
    end

  end
  # use for signin page
  def signin
  end
  #use for login
  def login
  	user = User.where("email = (?)",params[:email])
  	if user.exists?
      if user.first.password == params[:password]
        session[:id] = user.first.id
        flash[:notice] = "You are loged in"
        redirect_to posts_path
      else
        redirect_to signin_users_path, notice: 'email_id or password mismatch'
      end
    else
  		redirect_to signin_users_path, notice: 'email_id or password mismatch'
  	end
  end
  # use for Logout
  def logout
    session[:id] = ''
    flash[:notice] = "You are loged out"
    redirect_to signin_users_path

  end
  #show followings users
  def follow
    @users = User.all
    @users_id = current_user.user_followings.pluck(:following_id)
  end

  #show all user for followings
  def follow_unfollow
    @follower = current_user.user_followings.where("following_id = (?)", params[:id])
    if @follower.exists?
      u = UsersFollowing.where("follower_id = (?) and following_id = (?)", current_user[:id], params[:id])
      u.delete_all
      redirect_to follow_users_path
    else
      @users_id = current_user.user_followings.build(following_id: params[:id])
        if @users_id.save
           redirect_to follow_users_path
        else
          redirect_to follow_users_path
        end
    end
  end

  def autocomplete_user_name
    term = params[:term]
    brand_id = params[:brand_id]
    country = params[:country]
    users = User.where('name LIKE ?',"%#{term}%").order(:name).all
    render :json => users.map { |user| {:id => user.id, :label => user.name, :value => user.name} }
  end
  #show all user follower
  def followers
    @followers = current_user.followers
  end
  #show all users followings
  def followings
    @followings = current_user.followings
  end

  #show all user favourites post
  def favourite_show
    @favourites = current_user.favourites.pluck(:post_id)
    @posts = Post.where(id: @favourites)
    # TODO check it
  end
  #show users all private message
  def new_messages
    @users = User.all
    @message = Message.new
    @messages = Message.where(to: current_user.id)
  end

  #this method create user message
  def messages
    u = User.find_by_email(params[:message][:to]).id
    params[:message][:to] = u
    p = params.require(:message).permit(:to, :text)
    @message = current_user.messages.build(p)
    if @message.save
      respond_to do |format|
        format.js
      end
    end
 end

  #show change user password
  def change_password
    @profile = current_user
  end

  # change user password
  def change_password_method
    respond_to do |format|
      if current_user.update(email: params[:email], password: params[:password])
        format.js
        format.html { redirect_to posts_path, notice: 'Password was successfully updated.' }
      else
        format.html { redirect_to change_password_user_path, notice: 'Password was not successfully updated.' }
      end
    end
  end
  private
    def profile_param
      params.permit(:lastName, :dob, :gender, :country, :zip, :mobile, :image)
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, profile_attributes: [:lastName, :dob, :gender, :country, :zip, :mobile, :image])
    end
end