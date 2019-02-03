Rails.application.routes.draw do
  devise_for :users
  resources :items
  root :to =>  'histories#index'
end


