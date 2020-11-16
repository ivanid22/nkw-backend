class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def check_profile_belongs_to_user
    unless current_user.user_profile == UserProfile.find(params[:id])
      @errors = ['Not authorized to perform this action']
      render 'errors/show', status: :unauthorized
    end
  end

end
