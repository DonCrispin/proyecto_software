Rails.application.routes.draw do
  resources :books do
	  resources :copies
  end
  devise_for :admins
  devise_for :users
  resources :editorials
  resources :authors
  resources :admins
  resources :users do
    resources :loans
  end
  resources :themes
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
