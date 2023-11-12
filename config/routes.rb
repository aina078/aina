Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get    'okashis/candy'          => 'okashis#candy'
get    'okashis/cake'          => 'okashis#cake'
get    'okashis/bis'          => 'okashis#bis'
get    'okashis/choco'          => 'okashis#choco'
get    'okashis/gam'          => 'okashis#gam'
get    'okashis/snack'          => 'okashis#snack'
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  resources :okashis do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
end

root 'okashis#index'
end