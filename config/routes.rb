Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "viz#index"

  resources :users, param: :slug do
    resources :graph
  end

end
