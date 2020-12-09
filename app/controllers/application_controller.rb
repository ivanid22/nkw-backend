class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def check_profile_belongs_to_user
    return if current_user.user_profile == UserProfile.find(params[:id])

    @errors = ['Not authorized to perform this action']
    render 'errors/show', status: :unauthorized
  end

  def heartbeat
    # Used to signal the app to wake up
    render json: { 'awake' => true }.to_json
  end
end
