Rails.application.routes.draw do
  mount Arara::Engine => "/arara"

  resources :posts
  get ':id', to: 'pages#show', as: :pages

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#show"
end
