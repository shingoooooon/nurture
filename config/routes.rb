Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :courses do
    resources :assignments, only: %i[new create index show edit]
  end
end
