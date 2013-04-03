Loginapp::Application.routes.draw do
  get "home/index"

  devise_for :users

  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'
  root :to => "home#index"

end
