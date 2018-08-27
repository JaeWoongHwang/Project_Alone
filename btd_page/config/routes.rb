Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get 'homes/service' => 'homes#service'
  get 'homes/team' => 'homes#team'
  get 'homes/press' => 'homes#press'
  get 'homes/contact' => 'homes#contact'
end
