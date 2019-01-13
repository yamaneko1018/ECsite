Rails.application.routes.draw do
  devise_for :users
  resources :items, only:[:index,:update,:show]do
    collection do
      get 'complete'
    end
  end
  root :to =>  'histories#index'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine,at:"/letter_opener"
  end
end


