class ProfilesController < ApplicationController
  # before_action :check_address, only: [:address]
  # before_action :check_company, only: [:company]
  # user basic information
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      @step_1 = 1
      redirect_to address_profiles_path
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

  #user address
  def address
    @address = Address.new
  end

  def create_address
    @address = current_user.build_address(address_params)
    if @address.save
      @step_1 = 0
      @step_2 = 1
      redirect_to posts_path
    else
      render 'address_information'
    end
  end

  def edit_address
    if current_user.address.present?
      @address = current_user.address
    else
       @address = Address.new
    end

  end

  def update_address
   @address = current_user.build_address
   if @address.update(address_params)
      redirect_to posts_path
   else
    render 'edit_address'
   end
  end
  #user past company information
  def company
    @company = PastsCompany.new
  end

  def create_company
    @information = current_user.pasts_companies.build(company_params)
    if @information.save
      @step_1 = 0
      @step_2 = 0
      redirect_to posts_path
    else
      render 'address_information'
    end
  end

  def edit_company
    if current_user.pasts_companies.present?
      @companies = current_user.pasts_companies
    else
      @company = PastsCompany.new
    end
  end

  def update_company
   @information = current_user.pasts_companies.build
   if @address.update(company_params)
      redirect_to update_profile_user_path(current_user)
   else
    render 'edit_company'
   end
  end

  # validation for User informations
  def check_address
    if current_user.address.present?
      render 'address'
    else
      redirect_to new_profile_path
    end
  end

  def check_company
    if current_user.address.present?
      render 'company'
    else
      redirect_to new_profile_path
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:name, :lastName, :dob, :gender, :mobile, :image)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  def address_params
    params.require(:address).permit(:first_address, :second_address, :country, :state, :city, :zipcode)
  end
  def company_params
    params.require(:pasts_company).permit(:name, :location, :designation, :year, :month)
  end
end
