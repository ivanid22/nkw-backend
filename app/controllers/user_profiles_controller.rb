class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_belongs_to_user, only: [:update]

  def index
    @user_profiles = UserProfile.all
    render 'index'
  end

  def show
    @user_profile = UserProfile.find(params[:id])
    render 'show'
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update(user_profile_params)
      render 'show'
    else
      @errors = @user_profile.errors.messages
      render 'errors/show'
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    if @user_profile.save
      render 'show'
    else
      @errors = @user_profile.errors.messages
      render 'errors/show'
    end
  end

  def destroy
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.destroy
      render 'user_profiles/delete'
    else
      @errors = @user_profile.errors.messages
      render 'errors/show'
    end
  end

  def upload_picture
    @user_profile = current_user.user_profile
    return unless @user_profile

    @user_profile.avatar.attach(params[:avatar])
    render json: { 'status': 'success', 'avatar_url': url_for(@user_profile.avatar) }.to_json
  end

  def current_user_profile
    @user_profile = current_user.user_profile
    puts "current user: #{current_user}"
    render 'show'
  end

  def user_profile_params
    params.require(:user_profile).permit(:name, :location, :avatar)
  end
end
