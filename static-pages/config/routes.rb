Rails.application.routes.draw do

  get '/signup', to: 'user#new'

  root 'static_pages#home'

  get '/help', to: 'static_pages#help', as: "helf"
  get '/contact', to: 'static_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
