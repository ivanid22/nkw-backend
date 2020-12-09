Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    confirmations:      'devise_token_auth/confirmations',
    passwords:          'devise_token_auth/passwords',
    omniauth_callbacks: 'devise_token_auth/omniauth_callbacks',
    registrations:      'registrations_callback',
    sessions:           'devise_token_auth/sessions',
    token_validations:  'devise_token_auth/token_validations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'heartbeat', to: 'application#heartbeat'

  scope '/v1' do
    get 'user_profiles/current', to: "user_profiles#current_user_profile"
    resources :postings
    resources :user_profiles
    resources :favorites, except: [:update]
    post 'postings/:id/picture', to: "postings#upload_picture"
    post 'user_profiles/picture', to: "user_profiles#upload_picture"
  end
end
