Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  resources :users, param: :_username do
    resources :buys 
  end

  resources :users, param: :_username do
    resources :rents 
  end

end