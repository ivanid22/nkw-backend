class RegistrationsCallbackController < DeviseTokenAuth::RegistrationsController
  def create
    super do |registered_user|
      name = registered_user.nickname || "User"
      UserProfile.create(user: registered_user, name: name, location: 'Not defined')
    end
  end
end
