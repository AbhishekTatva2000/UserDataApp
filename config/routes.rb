Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :user
  get 'user/search/:search', to: 'user#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
