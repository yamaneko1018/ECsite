Rails.application.routes.draw do
  devise_for :users
  resources :items, only:[:index,:update,:show]do
    collection do
      get 'complete'
    end
  end
  root :to =>  'histories#index'
end


