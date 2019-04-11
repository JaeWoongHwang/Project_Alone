Rails.application.routes.draw do
  root 'apps#index'

  get 'apps/index'
  get 'apps/crawler'
  get 'apps/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
