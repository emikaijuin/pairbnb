Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  
  get "/listings/property_types" => "listings#property_types", as: "listing_property_types"
  resources :listings

  root :to => "listings#index"
end
