Rails.application.routes.draw do
  root to: 'homes#top'
  # resources :books
  get 'books/new'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
   # .../books/1 や .../books/3 に該当する
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
