Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :create, :edit, :update, :destroy]

  root "pages#index"
end
