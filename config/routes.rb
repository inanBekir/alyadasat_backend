Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth_user' => 'authentication#authenticate_user'
  namespace :v1 do
    get 'health' => 'health#health'
    resources :products
  end
end
