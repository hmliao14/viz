Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/viz" => "viz#index", as: "viz"

  resources :users do
    resources :graph
  end

end
