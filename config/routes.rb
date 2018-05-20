Rails.application.routes.draw do
  devise_for :users
  resources :shops do
    resources :drinks
    resources :shop_comments
  end

  resources :locations

  root 'welcome#index'
end
