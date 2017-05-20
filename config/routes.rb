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
  get 'about', to: 'home#about'
  post 'users/:user_id/loans/:id/return', to: 'loans#return_loan'
  post 'users/:user_id/loans/:id/cancel', to: 'loans#cancel_loan'
  post 'users/:user_id/loans/add_loan', to: 'loans#add_loan'
  #HYBRID
  get '/admin/checkuser', to: 'admins#check_user'
  get 'users/:user_id/user_loans', to: 'loans#user_loans'
  get 'books/:book_id/notlended', to: 'copies#notlended'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
