Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :articles
  
  resources :projects do 
    resources :issues, shallow: true
    resources :activities, shallow: true
  end
  
  root "pages#index"
end
