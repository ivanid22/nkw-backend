class FavoritesController < ApplicationController
  def create
    @user_profile = UserProfile.find(params[:user_profile_id])
    @
  end

  def favorite_params
    params.require(:favorite).permit(:user_profile_id, :posting_id)
  end
end
