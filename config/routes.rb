Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  resources :users, param: :_username do
    resources :buys 
    resources :rents 
  end

  # resources :users, param: :_username do
  #   resources :buys do
  #     resources :comments, only: [:create]
  #   end

  #   resources :rents do
  #     resources :comments, only: [:create]
  #   end
  # end

  post '/comments', to: 'comments#create'
  # get '/comments', to: 'comments#index'
  # get '/comments/:id', to: 'comments#show'
  # delete 'comments/:id', to: 'comments#destroy'



  post '/images', to: 'images#create'
  get '/images', to: 'images#index'

end