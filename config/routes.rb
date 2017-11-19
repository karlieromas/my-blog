Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  # get '/posts', to: 'posts#index', as: 'posts'
  # # index, show, edit, new, update, delete, create

  # get '/posts/:id', to: 'posts#show', as: 'post'
end
