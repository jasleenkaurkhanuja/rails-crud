Rails.application.routes.draw do
  get '/users', to:'users#index'
  get '/users/:id', to:'users#show'
  put '/users/:id', to:'users#update'
  delete '/users/:id', to:'users#destroy'
  post '/users', to:'users#create'
  post '/users/:id', to: 'users#welcome'

  post 'articles/:article_id/comments', to:'comments#create'
  root "articles#index"
  get "/articles", to: 'articles#index'
  get "/articles/:id", to:'articles#show'
  get "/articles/new"
  post '/articles', to: 'articles#create'
  delete '/articles/:id', to:'articles#delete'
  put '/articles/:id', to:'articles#update'
  get '/articles/:id/edit', to:'articles#edit' 
end
