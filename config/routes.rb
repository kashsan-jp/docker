Rails.application.routes.draw do
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
end
