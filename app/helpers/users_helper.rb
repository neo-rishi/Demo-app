module UsersHelper
  def show_count
    @tweet = User.find(params[:id]).posts.count
    @followings = User.find(params[:id]).followings.count
    @followers = User.find(params[:id]).followers.count
    @favourites = User.find(params[:id]).favourites.count
    return @tweet, @followers, @followings, @favourites
  end
end
