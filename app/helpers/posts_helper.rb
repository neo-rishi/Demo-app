module PostsHelper

  def favourit?
    current_user.favourites.pluck(:post_id)
  end
end
