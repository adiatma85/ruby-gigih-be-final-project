Rails.application.routes.draw do
  resources :orders
  resources :categories
  resources :menus

  get '/reports/by_email', to: 'report#by_email'
  get '/reports/detail/by_email', to: 'report#by_detail_email'

  get '/reports/by_value', to: 'report#by_value'
  get '/reports/detail/by_value', to: 'report#by_detail_value'

  get '/reports/by_date', to: 'report#by_date'
  get '/reports/detail/by_date', to: 'report#by_detail_date'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
