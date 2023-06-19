Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show, :create, :update, :destroy]
      resources :services, only: [:index, :show, :create, :update, :destroy]
      resources :bookings, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
