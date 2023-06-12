Rails.application.routes.draw do

  root 'sessions#new'
  
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
   resources :sessions

   namespace :api do
      resources :shelfs, only: [:index]
      resources :books, only: [:index]
      resources :members, only: [:index]
   end


   
   
end
