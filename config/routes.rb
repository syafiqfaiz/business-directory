Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'welcomes#index'
  resources :tags, only: [:index, :show]
  resources :categories, only: [:index, :show] 
  resources :organisations, except: :index , path: '/company' do
    resources :products
  end

  resources :managers,  only: [:index, :show]
end
