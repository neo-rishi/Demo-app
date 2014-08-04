class UsersController < ApplicationController
	before_action :user_params, only: [:create]
  before_action :authenticate, except: [:create, :login, :new, :signin]
  session ={user: '', email: ''}
  def index

  end


  def new
  	@user = User.new
  end
#use for siginup page create user
  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user] = @user
      #TODO Display notice on view
      flash[:notice] = "You are loged in"
  		redirect_to  posts_path
  	else
  		render 'new'
  	end
  end

  # use for signin page
  def signin

  end
  #use for login
  def login
  	obj = User.where("email = (?) and password =  (?)",params[:email],params[:password])
  	if obj.exists?

  		session[:user] = obj.first
      session[:email] =params[:email]
      p '..................................................................'
      flash[:notice] = "You are loged in"
      redirect_to posts_path
  	else
  		render 'index'
  	end

  end
  # use for Logout
  def logout
    session[:email]=''
    flash[:notice] = "You are loged out"
    redirect_to signin_users_path

  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
