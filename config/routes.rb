Rails.application.routes.draw do
  devise_for :users

  # authenticated :user do
  #   root to: 'users#show', as: :authenticated_root
  # end

  root to: "viz#index"
  resources :users, param: :slug, :only => [:show, :edit]
    patch "/users/:slug/" => "users#update"
  resources :graphs

  post 'graphs/:id/copy', to: 'graphs#copy', as: "copy_graph"

end
