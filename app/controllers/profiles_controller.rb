class ProfilesController < ApplicationController
  # before_action :require_login
  # this can come in handy later on. requires
  before_action :set_profile, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to edit_user_profile_path(current_user, @profile), notice: "Profile succesfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path(@profile), notice: "Profile succesfully updated"
    else
      render :edit
    end
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :prefix, :last_name, :street_name, :house_number, :house_number_addition, :zip_code, :city, :phone_number)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access your profile."
      redirect_to new_login_url
    end
  end
end
