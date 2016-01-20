Rails.application.routes.draw do
  root 'welcomes#index'

  resources :organisations, except: :index do
    resources :products
  end

end
