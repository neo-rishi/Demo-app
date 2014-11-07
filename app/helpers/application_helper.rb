module ApplicationHelper
  def current_user_name
    unless current_user.profile.blank?
      current_user.profile.name + " "+ current_user.profile.lastName
    else
      'User'
    end
  end

  def following_users
    current_user.followings.pluck(:id) << (current_user[:id])
  end

  def count_tweet
    current_user.posts.count
  end

  def follows
    User.where("id NOT IN (?)", following_users).first(5)
  end
end
