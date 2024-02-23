Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments # a nested resource within articles
  end
end
