Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :v1, defaults: {format: 'json'} do
  #   resources :bucket_list
  # end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
