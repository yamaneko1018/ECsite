Rails.application.routes.draw do
  devise_for :users
  resources :items, only:[:index,:new,:update,:show] do
    collection do
      post :confirm
    end
  end
  root :to =>  'histories#index'
end


