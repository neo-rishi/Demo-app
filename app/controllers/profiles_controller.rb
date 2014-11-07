class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to  update_profile_user_path(current_user)
    else
      render 'edit'
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :lastName, :dob, :gender, :mobile, :image)
  end

end
