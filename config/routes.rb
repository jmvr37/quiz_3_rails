Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get("/", {to: "welcome#index", as: "root"})

  resources :ideas do 
    resources :reviews, only: [:create, :destroy], shallow: true

  end
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]
end

