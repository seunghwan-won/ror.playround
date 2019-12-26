Rails.application.routes.draw do
  resources :birds
  get 'welcome/index'

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'welcome#index', :as => 'home'
  root 'welcome#index'
end
