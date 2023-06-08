Rails.application.routes.draw do

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
