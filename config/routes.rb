Rails.application.routes.draw do
  root to: 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#delete'

  get 'users/me' => 'users#me'
  get 'users/me/edit' => 'users#me_edit'
  put 'users/me/edit' => 'users#update'

  namespace :users do
    get 'register' => 'register#index'
    get 'register/thanks' => 'register#thanks'
    post 'register' => 'register#create'
  end

  get 'contacts' => 'contacts#new'
  get 'contacts/thanks' => 'contacts#thanks'
  post 'contacts' => 'contacts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
