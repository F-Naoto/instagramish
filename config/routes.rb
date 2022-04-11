Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } 

  root 'posts#index'

  get '/users/:id', to: 'users#show', as: 'user'
  # ==========ここから編集する==========
#   array = %i(Ruby Python PHP)
# p array
# # => [:Ruby, :Python, :PHP]
#only:[:new, :create, :index]
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end