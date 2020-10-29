Rails.application.routes.draw do
  get 'gossips/new'
  get 'gossips/create'
  get '/', to:'static_pages#home', as: 'root'
  get 'welcome/:first_name', to: 'static_pages#welcome', as:'welcome'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/user/:author_info', to: 'static_pages#author', as:'author'

  resources :gossips
  resources :cities, only: [:show]
  resources :comments, only: [:new, :create, :show, :index]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
