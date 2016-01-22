Rails.application.routes.draw do


  root 'welcomes#index'
  resources :tags, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    resources :company, controller: 'organisations', except: :index do
      resources :products
    end
  end

end
