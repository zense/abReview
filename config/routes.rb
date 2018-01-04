Rails.application.routes.draw do
  resources :open_studios, :only => [:show, :new, :create]
  resources :open_houses, :only => [:show, :new, :create]
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :reviews, :except => [:destroy, :new, :create]
  resources :categories, :only => [:show]
  resources :abstract_docs, :except => [:destroy, :index]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  get "abstract" => "pages#abstract"
  get ":slug" => "pages#show", :as => 'page'

  root "pages#show", slug: "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
