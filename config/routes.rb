Rails.application.routes.draw do

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get 'confirm_email', to: 'users/registrations#confirm_email'
  end
  namespace :admin do
    resources :users
    get 'admin/users/index'
    root to: 'users#index'
  end
  get 'home/index'
  get 'home/user_page'
  get 'users/show'
  post "posts/:post_id/comments/:id" => "comments#destroy"
  post "posts/:id/destroy" => "posts#destroy"
  post 'posts/confirm' => "posts#confirm"
  root to: 'home#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
