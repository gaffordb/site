Rails.application.routes.draw do

  get 'users/new'

  root 'static_pages#source'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/home',    to: 'static_pages#home'
  post '/signup',  to: 'users#create'
  patch '/signup', to: 'users#create'
  get '/', to: 'static_pages#source'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
