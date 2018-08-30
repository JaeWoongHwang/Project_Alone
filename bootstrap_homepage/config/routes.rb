Rails.application.routes.draw do
  root 'homes#index'

  get 'homes/index'
  get 'homes/service'
  get 'homes/team'
  get 'homes/press'
  get 'homes/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
