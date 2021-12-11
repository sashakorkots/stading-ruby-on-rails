Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]
  end

  root "pages#index"
end
