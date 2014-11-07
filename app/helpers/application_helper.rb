module ApplicationHelper
  def current_user_name
      current_user.profile.name + " "+ current_user.profile.lastName
  end
end
