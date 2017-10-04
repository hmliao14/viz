Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "viz#index"
  resources :users, param: :slug, :only => [:show, :edit]
    patch "/users/:slug/" => "users#update"
  resources :graphs

  post 'graphs/:id/copy', to: 'graphs#copy', as: "copy_graph"

end
