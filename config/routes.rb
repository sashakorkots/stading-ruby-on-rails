Rails.application.routes.draw do
  resources :questions do
    resources :answers, extend: %i[new show]
  end

  root 'pages#index'
end
