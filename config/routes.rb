Rails.application.routes.draw do
 
 

  resources :cities
  get 'muestra/principal'

  get 'muestra/segundo'

  get 'administration/index', to: 'administration#index', as: 'administration'
  get 'usershow/:id', to: 'usershows#show', as: 'usershow'
  get 'question/:id', to: 'questions#show', as: 'question'
  get 'usershow/articulos/:id', to: 'usershows#articulos', as: 'articulos_usershow'
  get 'download_pdf', to: "home#download_doc", as: 'download_contrato'
  get 'articles/photo/:id,:article', to: "articles#photo", as: 'photo_article'
  get 'search/create'
  get 'cities_search', to: 'cities#search'
  devise_for :users
  resources :questions
  resources :comments
  resources :brands
  resources :phones
  resources :articles
  resources :advertisements
  resources :publications
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
