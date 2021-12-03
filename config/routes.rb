Rails.application.routes.draw do
  post "/questions", to: "questions#create"
  get "/questions/new", to: "questions#new"
  get "/questions", to: "questions#index"
  root "pages#index"
end
