Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  # get '/friends', to: "friends#index"
  # get '/friends/:id', to: "friends#show"
  root 'friends#index'

    get 'search', to: 'friends#search'


  resources :friends do
     get :autocomplete_friend_first_name, :on => :collection

  end


  resources :photos

  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"
  #
  # delete 'friends/:id/delete' => 'friends#destroy', as: 'friends_delete'
  # get '/friends/:id/delete' => 'friends#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
