Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  # get '/posts', to: 'posts#index', as: 'posts'
  # # index, show, edit, new, update, delete, create

  # get '/posts/:id', to: 'posts#show', as: 'post'
end
