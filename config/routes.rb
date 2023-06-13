Rails.application.routes.draw do

  devise_for :members
  root 'sections#index'
  
  get 'sessions/new'

  namespace :api do
    get 'members/index'
  end

  namespace :api do
    get 'books/index'
  end
  
   resources :sections
   resources :shelfs
   resources :books
   resources :members

   namespace :api do
      resources :shelfs, only: [:index]
      resources :books, only: [:index]
      resources :members, only: [:index]
   end


   
   
end
