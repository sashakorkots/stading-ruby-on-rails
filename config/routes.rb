Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :create, :edit, :update]

  root "pages#index"
end
