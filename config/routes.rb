Rails.application.routes.draw do
  devise_for :users, path: "user", controllers: {
    registrations: "users/registrations"
  }

  resource :user, only: %i[show edit update destroy]

  root to: "home#index"
end
