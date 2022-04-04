Rails.application.routes.draw do
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加

  root 'pages#home'

  get '/users/:id', to: 'users#show', as: 'user'
end