class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_belongs_to_user, only: [:update]

  def index
    @user_profiles = UserProfile.all
    render "index"
  end

  def show
    @user_profile = UserProfile.find(params[:id])
    render 'show'
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update(user_profile_params)
      render "show"
    else
      @errors = @user_profile.errors.messages
      render "errors/show"
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    if @user_profile.save
      render "show"
    else
      @errors = @user_profile.errors.messages
      render "errors/show"
    end
  end

  def destroy
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.destroy
      render "user_profiles/delete"
    else
      @errors = @user_profile.errors.messages
      render "errors/show"
    end
  end

  def user_profile_params
    params.require(:user_profile).permit(:name, :location)
  end
end
