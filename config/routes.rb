Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] 
  
  resources :registered_applications do
  	resources :events
  end


  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
