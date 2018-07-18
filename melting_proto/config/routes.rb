Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    post "/like", to: "likes#like_toggle"
    resources :comments, except: [:index, :new, :show] do
        member do
          get :reply
      end
    end
  end
  resources :follows, only: [:create, :destroy]

  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
