Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/v1' do
    resources :postings
    resources :user_profiles
  end
end
