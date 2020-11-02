Rails.application.routes.draw do

  get 'users/show'

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
  namespace :admin do
    resources :users
    get 'admin/users/index'
    root to: 'users#index'
  end
  get 'home/index'
  get 'home/user_page'
  root to: 'home#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
