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

end