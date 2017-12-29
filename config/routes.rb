Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :reviews
  resources :categories
  resources :abstract_docs
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  get "review" => "pages#review"
  get ":slug" => "pages#show", :as => 'page'

  root "pages#show", slug: "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
