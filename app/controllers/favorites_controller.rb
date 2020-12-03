class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[create index destroy]

  def create
    @user_profile = current_user.user_profile
    @posting = Posting.find(params[:posting_id])
    if !Favorite.exists?(@user_profile, @posting)
      @favorite = Favorite.create(user_profile: @user_profile, posting: @posting)
      render 'show'
    else
      @errors = ['Favorite for that user and posting already exists']
      render 'errors/show'
    end
  end

  def index
    @favorites = Favorite.where(user_profile: current_user.user_profile)
    render 'index'
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if current_user.user_profile.id != @favorite.user_profile.id
      @errors = ['Unauthorized to remove favorite entry']
      render 'errors/error'
    elsif @favorite.destroy
      render 'favorites/delete'
    else
      @errors = ['Unable to delete favorite entry']
      render 'errors/show'
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
    if @favorite
      render 'show'
    else
      @errors = ["Could not find favorite with id #{params[:id]}"]
      render 'errors/show'
    end
  end

  def favorite_params
    params.require(:favorite).permit(:user_profile_id, :posting_id)
  end
end
